-- Run this once in Supabase SQL Editor.
create extension if not exists pgcrypto;

create table if not exists public.safety_reports (
  id uuid primary key default gen_random_uuid(),
  report_date date not null default current_date,
  lab text not null check (lab in ('كيمياء','فيزياء')),
  report_type text not null,
  status text not null default 'مفتوح' check (status in ('مفتوح','عاجل','مغلق')),
  title text not null,
  findings text not null,
  corrective_action text,
  follow_up_owner text,
  due_date date,
  created_by uuid not null references auth.users(id) on delete restrict,
  created_by_email text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.safety_reports enable row level security;

grant select, insert, update, delete on table public.safety_reports to authenticated;

-- Every signed-in safety-team member can see the shared report log.
create policy "team can read reports" on public.safety_reports
for select to authenticated using (true);

-- A signed-in member may create a report only as themselves.
create policy "team can create reports" on public.safety_reports
for insert to authenticated with check (created_by = auth.uid());

-- Shared-team workflow: signed-in members may update reports.
create policy "team can update reports" on public.safety_reports
for update to authenticated using (true) with check (true);

-- Shared-team workflow: signed-in members may delete reports.
create policy "team can delete reports" on public.safety_reports
for delete to authenticated using (true);
