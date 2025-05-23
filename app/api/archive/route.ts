import { query } from '../../../lib/db';
import { NextResponse } from 'next/server';

function formatDateTime(isoString: string | undefined): string | null {
  if (!isoString) return null;
  const date = new Date(isoString);
  if (isNaN(date.getTime())) return null;
  // JST (UTC+9) に変換
  const jstOffset = 9 * 60; // 9時間（分単位）
  const jstDate = new Date(date.getTime() + jstOffset * 60 * 1000);
  return jstDate.toISOString().replace('T', ' ').replace('Z', '').slice(0, 19);
}

export async function GET() {
  try {
    const apiKey = process.env.YOUTUBE_API_KEY;
    if (!apiKey) {
      console.error('Missing YOUTUBE_API_KEY');
      return NextResponse.json([], { status: 200 });
    }

    const channelIds = [
      'UC1DCedRgGHBdm81E1llLhOQ', // 兎田ぺこら
      'UCdn5BQ06XqgXoAxIhbqw5Rg', // 白上フブキ
      'UC9V3Y3_uzU5xD0n7cHLZfq', // 星川サラ
      'UCiMG6VdScBabPhJ1ZtaVmbw', // 花芽なずな
    ];

    const weekAgo = new Date(Date.now() - 7 * 24 * 60 * 60 * 1000).toISOString();
    const videoIds: string[] = [];
    for (const channelId of channelIds) {
      const response = await fetch(
        `https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=${channelId}&type=video&publishedAfter=${weekAgo}&maxResults=5&key=${apiKey}`
      );
      if (!response.ok) {
        console.error(`YouTube API error for ${channelId}: ${response.status}`);
        continue;
      }
      const data = await response.json();
      console.log(`YouTube search response (archive, ${channelId}):`, data);
      if (data.items?.length) {
        videoIds.push(...data.items.map((item: any) => item.id.videoId).filter(Boolean));
      }
    }

    if (!videoIds.length) {
      const schedules = await query('SELECT s.*, v.name, v.vtuber_group FROM schedules s JOIN vtubers v ON s.vtuber_id = v.id WHERE type = ?', ['archive']);
      console.log('DB schedules (archive):', schedules);
      return NextResponse.json(schedules || []);
    }

    const videosResponse = await fetch(
      `https://www.googleapis.com/youtube/v3/videos?part=snippet,statistics&id=${videoIds.join(',')}&key=${apiKey}`
    );
    if (!videosResponse.ok) {
      console.error(`YouTube videos API error: ${videosResponse.status}`);
      return NextResponse.json([], { status: 200 });
    }
    const videosData = await videosResponse.json();
    console.log('YouTube videos response (archive):', videosData);

    for (const item of videosData.items) {
      if (!item.snippet || !item.id) continue;
      const startTime = item.snippet.publishedAt;
      if (!startTime) continue;
      const formattedDateTime = formatDateTime(startTime);
      if (!formattedDateTime) continue;

      try {
        await query(
          `INSERT INTO schedules (id, vtuber_id, type, title, start_time, url, thumbnail_url, view_count)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE
           title = ?, start_time = ?, url = ?, thumbnail_url = ?, view_count = ?`,
          [
            item.id,
            item.snippet.channelId,
            'archive',
            item.snippet.title || 'Untitled',
            formattedDateTime,
            `https://youtube.com/watch?v=${item.id}`,
            item.snippet.thumbnails?.medium?.url || null,
            item.statistics?.viewCount ? parseInt(item.statistics.viewCount) : null,
            item.snippet.title || 'Untitled',
            formattedDateTime,
            `https://youtube.com/watch?v=${item.id}`,
            item.snippet.thumbnails?.medium?.url || null,
            item.statistics?.viewCount ? parseInt(item.statistics.viewCount) : null,
          ]
        );
      } catch (dbError: any) {
        console.error(`DB error for video ${item.id}: ${dbError.message}`);
      }
    }

    const schedules = await query('SELECT s.*, v.name, v.vtuber_group FROM schedules s JOIN vtubers v ON s.vtuber_id = v.id WHERE type = ?', ['archive']);
    console.log('Final schedules (archive):', schedules);
    return NextResponse.json(schedules || []);
  } catch (error: any) {
    console.error('Error in /api/archive:', error.message);
    return NextResponse.json([], { status: 200 });
  }
}