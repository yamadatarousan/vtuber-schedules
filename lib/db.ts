import mysql from 'mysql2/promise';

const pool = mysql.createPool(process.env.DATABASE_URL || '');

export async function query(sql: string, params: any[] = []) {
  try {
    const [results] = await pool.query(sql, params);
    return results;
  } catch (error) {
    console.error('DB error:', error);
    throw error;
  }
}