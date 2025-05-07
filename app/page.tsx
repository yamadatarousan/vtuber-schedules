'use client';
import { useState, useEffect } from 'react';

interface Schedule {
  id: string;
  vtuber_id: string;
  type: 'live' | 'upcoming' | 'archive';
  title: string;
  start_time: string;
  url: string;
  thumbnail_url: string | null;
  view_count: number | null;
  name: string;
  vtuber_group: string;
}

function getGroupColor(group: string) {
  switch (group.toLowerCase()) {
    case 'hololive':
      return { border: 'border-pink-500', bg: 'bg-pink-500', text: 'text-white' };
    case 'nijisanji':
      return { border: 'border-purple-500', bg: 'bg-purple-500', text: 'text-white' };
    case 'vspo':
      return { border: 'border-blue-500', bg: 'bg-blue-500', text: 'text-white' };
    default:
      return { border: 'border-gray-500', bg: 'bg-gray-500', text: 'text-white' };
  }
}

export default function Home() {
  const [tab, setTab] = useState<'live' | 'upcoming' | 'archive'>('live');
  const [schedules, setSchedules] = useState<Schedule[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    setLoading(true);
    fetch(`/api/${tab}`)
      .then((res) => res.json())
      .then((data) => {
        console.log(`API response (${tab}):`, data);
        if (Array.isArray(data)) {
          setSchedules(data);
        } else {
          setError('Invalid data format from API');
          setSchedules([]);
        }
      })
      .catch((error) => {
        console.error(`Error fetching ${tab}:`, error);
        setError('Failed to fetch schedules');
        setSchedules([]);
      })
      .finally(() => setLoading(false));
  }, [tab]);

  if (loading) return <div className="min-h-screen bg-black text-white p-4">Loading...</div>;
  if (error) return <div className="min-h-screen bg-black text-white p-4">Error: {error}</div>;

  return (
    <div className="min-h-screen bg-black text-white p-4">
      <h1 className="text-2xl font-bold mb-4">VTuber Schedules</h1>
      <div className="flex gap-4 mb-4">
        <button
          className={`px-4 py-2 rounded ${tab === 'live' ? 'bg-blue-500' : 'bg-gray-700'}`}
          onClick={() => setTab('live')}
        >
          Live
        </button>
        <button
          className={`px-4 py-2 rounded ${tab === 'upcoming' ? 'bg-blue-500' : 'bg-gray-700'}`}
          onClick={() => setTab('upcoming')}
        >
          Upcoming
        </button>
        <button
          className={`px-4 py-2 rounded ${tab === 'archive' ? 'bg-blue-500' : 'bg-gray-700'}`}
          onClick={() => setTab('archive')}
        >
          Archive
        </button>
      </div>
      {schedules.length === 0 ? (
        <p>No {tab} schedules found.</p>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          {schedules.map((schedule) => {
            const colors = getGroupColor(schedule.vtuber_group);
            return (
              <a
                key={schedule.id}
                href={schedule.url}
                target="_blank"
                rel="noopener noreferrer"
                className={`border ${colors.border} p-4 rounded-lg`}
              >
                <img
                  src={schedule.thumbnail_url || '/placeholder.jpg'}
                  alt={schedule.title}
                  className="w-full h-32 object-cover rounded mb-2"
                />
                <h2 className="text-lg font-semibold">{schedule.title}</h2>
                <p>{schedule.name} ({schedule.vtuber_group})</p>
                <p>
                  {new Date(schedule.start_time).toLocaleString('ja-JP', {
                    timeZone: 'Asia/Tokyo',
                    year: 'numeric',
                    month: '2-digit',
                    day: '2-digit',
                    hour: '2-digit',
                    minute: '2-digit',
                  })}
                </p>
                {schedule.view_count && <p>Views: {schedule.view_count}</p>}
              </a>
            );
          })}
        </div>
      )}
    </div>
  );
}