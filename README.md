Updated Tech Build Checklist (Mar 22 to Apr 7, 2026)
Here is your granular, day-by-day sprint plan, expanded to close the operational gaps.
PHASE 1: Infrastructure + Rails Scaffold (Days 1–2)
[ ] Repository: Create private GitHub repo (season-v2). Require PR reviews and run bin/brakeman and rubocop via GitHub Actions on every push
.
[ ] Hosting: Set up Render with PostgreSQL, custom domains, and environment variables (RAILS_MASTER_KEY, DATABASE_URL)
.
[ ] Operations: Set up Sentry for error tracking, Postmark/SendGrid for email, and a public status page
.
[ ] Scaffold: Run rails new season --database=postgresql --asset-pipeline=propshaft
.
[ ] Performance Tuning: Configure Ruby to use jemalloc via Dockerfile or environment, and ensure YJIT is active
.
[ ] Gems: Add Devise, Hotwire, Tailwind, Ransack, Stripe, and Brakeman
.
[ ] Database Schema: Generate core tables (users, cycle_entries, symptom_logs, reminders, etc.)
. Ensure automated database backups are scheduled on Render
.
PHASE 2: Authentication + Onboarding (Days 3–4)
[ ] Auth (M1): Install Devise and set up OmniAuth for Google, Facebook, and Apple
.
[ ] Admin Auth: Enforce MFA/2FA for the Admin roles
.
[ ] Invite Flow: Write rake task to import V1 users, build the /invite/:token landing page, and draft the personalized invite emails
.
[ ] Onboarding (M7): Build the step-by-step Turbo Frames flow (Cycle basics, contraception, last period, language toggle)
.
PHASE 3: Calendar + Cycle View (Days 5–7)
[ ] Cycle Engine (M2): Build CycleCalculatorService and implement logic for the 4 phases (Winter, Spring, Summer, Autumn)
.
[ ] Calendar UI (M1/M2): Build the monthly grid, phase color-coding, cycle day markers, and Hotwire modals for adding calendar events
.
PHASE 4: Symptom Tracking + Daily View (Days 8–10)
[ ] Tracking (M3): Build expandable symptom sections (mood, physical, sleep, etc.) using Turbo Frames and Stimulus for auto-saving
.
[ ] Daily View (M4): Create DailyViewController to display phase-specific tips, events, and superpower logic
. Utilize Solid Cache to cache these daily view HTML fragments efficiently
.
PHASE 5: Reminders + Notifications (Days 11–12)
[ ] Reminders (M5): Build CRUD controllers for supplement, pill, and period reminders
.
[ ] Background Processing: Set up Solid Queue (Rails 8 default) in production via SOLID_QUEUE_IN_PUMA: true for robust, database-backed background jobs
.
[ ] Scheduling: Create ReminderDeliveryJob using ActionMailer to run hourly
.
PHASE 6: Admin Panel + Paywall + QA (Days 13–14)
[ ] Admin Panel (M7): Build Admin::UsersController with Ransack search, filters, and CSV exports
.
[ ] Admin Tools: Add an "Impersonate User" button for customer support debugging
.
[ ] Paywall (M8): Configure Stripe checkout sessions, implement a basic upgrade prompt for premium features, and handle Stripe webhooks
.
[ ] Technical Debt: Create a specific tracking board or backlog for the shortcuts taken during this phase
. Define officially supported browsers (e.g., via CanIUse)
.
PHASE 7: QA + Migration Emails + Launch (Days 15–17)
[ ] End-to-End QA: Test auth, onboarding, tracking, daily view, and Stripe on mobile browsers and Hotwire Native iOS/Android wrappers
.
[ ] Security & Performance QA: Ensure bin/brakeman reports 0 vulnerabilities and verify production page load speeds
. Tune Puma threads and workers if latency is high
.
[ ] Migration Execution: Send Wave 2 invite emails (Apr 3-4), monitor acceptance rates, and send the final Wave 3 email on Apr 7
.
[ ] Go Live: Switch Stripe to live mode, enforce SSL, trigger the final deploy to Render, and submit Hotwire Native apps to Apple and Google stores
.
[ ] Post-Launch: Set up your data warehouse pipelines to capture Lead Time, Deployment Frequency, and Change Failure Rate metrics moving forward