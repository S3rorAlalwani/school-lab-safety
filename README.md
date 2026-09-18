# School Lab Safety Manager

Arabic RTL safety-report site designed for GitHub Pages with Supabase authentication and a shared database.

## Setup
1. Create a Supabase project.
2. In Supabase SQL Editor, run `setup.sql` once.
3. In Authentication, create the safety-team users who should be allowed to sign in. For a school deployment, keep public sign-up disabled unless your administrator specifically wants it.
4. In the Supabase Connect dialog / API Keys area, copy the Project URL and **publishable key**.
5. Open `index.html` and replace:
   - `PASTE_YOUR_SUPABASE_URL_HERE`
   - `PASTE_YOUR_SUPABASE_PUBLISHABLE_KEY_HERE`
6. Do **not** put a Supabase secret/service-role key in this repository or in browser JavaScript.
7. Upload `index.html` (and optionally this README) to a GitHub repository.
8. In GitHub: Settings → Pages → deploy from the `main` branch/root, then visit the published URL.

## What works
- Email/password login
- Shared safety reports for authenticated team members
- Add, edit, delete, search and filter reports
- Chemistry/physics lab selection
- Status dashboard
- Corrective-action and follow-up tracking
- CSV export
- Responsive Arabic interface

## Security note
The publishable key is intended for client-side use. Access is controlled by Supabase Row Level Security (RLS). The SQL file enables RLS and limits access to authenticated users.
