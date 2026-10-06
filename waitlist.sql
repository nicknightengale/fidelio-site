-- Run once in Supabase: SQL Editor
create table public.waitlist (
  id bigint generated always as identity primary key,
  email text not null unique,
  labels text[] default '{}',
  platform text,
  created_at timestamptz not null default now()
);
alter table public.waitlist enable row level security;
-- Visitors can add a row; nobody can read the list without your login.
create policy "anyone can join" on public.waitlist
  for insert to anon with check (true);
