# Season V2 (MVP)

**Internal Technical Documentation & Sprint Manifest** **Target Launch:** April 7, 2026  
[cite_start]**Mission:** Rapid rebuild of the "Season" women's health platform to migrate 150+ users from a deprecated V1 environment[cite: 346, 560].

---

## 🌟 Product Context: What is Season?
[cite_start]Season is an optimization platform designed to help women maximize their productivity and well-being by aligning their lifestyle with their menstrual cycle[cite: 1, 584]. [cite_start]The app’s "Value Engine" uses three primary data inputs to drive its experience[cite: 5, 6, 7]:

* [cite_start]**Biological Baselines:** Cycle metrics (length, regularity) and contraception types[cite: 9, 64, 92].
* [cite_start]**Demographics:** Age and identity profiling (Name, DOB)[cite: 8, 42].
* [cite_start]**Lifestyle & Diet:** Specific user preferences (e.g., Vegetarian, Vegan)[cite: 10, 54].

### The "Superpower" Logic
[cite_start]The "Core Engine" predicts a user's current hormonal phase—categorized as **Winter (Menstrual)**, **Spring (Follicular)**, **Summer (Ovulatory)**, or **Autumn (Luteal)**[cite: 12, 179, 194, 207, 219]. [cite_start]The app provides phase-specific recommendations for[cite: 567, 568]:
* **Sport:** e.g., Yoga and stretching vs. high-intensity training.
* **Nutrition:** Phase-appropriate advice (e.g., healthy fats like avocado).
* **Productivity:** Identifying "Superpowers" like self-reflection or peak communication.

---

## 🏗 System Architecture

| Layer | Specification |
| :--- | :--- |
| **Framework** | **Rails 8.1.x** (Strict "Convention Over Configuration") |
| **Ruby Runtime** | **3.4.4** (with **YJIT** enabled for performance) |
| **Database** | **PostgreSQL** (UUID Primary Keys for sync-readiness) |
| **Asset Pipeline** | **Propshaft** + **Tailwind CSS** (Standalone CLI) |
| **Background Jobs** | **Solid Queue** (Production: `SOLID_QUEUE_IN_PUMA: true`) |
| **Caching** | **Solid Cache** (Fragment caching for daily forecast views) |
| **Infrastructure** | **Render** (Phase 1) |

---

## 📊 Core Data Schema

### `User` (Identity & Baseline)
[cite_start]Primary store for authentication and biological baselines[cite: 376, 377].
* [cite_start]**Auth:** Devise (Email/Pass) + OmniAuth (Apple, Google, Facebook)[cite: 387, 391].
* [cite_start]**Cycle Metrics:** `cycle_length` (restricted 24-38 days), `period_length`, `regular_cycle`[cite: 94, 95].
* [cite_start]**Anchor:** `last_period_start` (The mathematical "Point of Origin" for prediction)[cite: 138, 142].

### `CycleEntry` (The Engine)
[cite_start]Calculated projection table used to power the Calendar UI[cite: 378, 432].
* [cite_start]**Phases:** Winter (Menstrual), Spring (Follicular), Summer (Ovulation), Autumn (Luteal)[cite: 430].

### `SymptomLog` (Daily Tracking)
[cite_start]Granular user-input logs for categories including Mood, Physical, Mental, and Sleep[cite: 379, 567].

---

## 📅 The April 7 Sprint Checklist

### Phase 1: Infrastructure & Foundation (Days 1–2)
- [x] [cite_start]Private GitHub repo with Brakeman/RuboCop CI[cite: 352].
- [x] [cite_start]Render Environment (PostgreSQL + Sentry + Postmark)[cite: 354, 358, 359].
- [x] [cite_start]Rails 8.1 Scaffold with Propshaft & Tailwind[cite: 364, 370].
- [ ] Performance Tuning: `jemalloc` config & YJIT activation.
- [ ] Core Migrations: `Users`, `CycleEntries`, `SymptomLogs`, `Reminders`.

### Phase 2: User Migration & Onboarding (Days 3–4)
- [ ] [cite_start]**M1:** Devise installation + Social Auth configuration[cite: 389, 391].
- [ ] [cite_start]**Migration:** Rake task for V1 CSV import + `/invite/:token` secure landing page[cite: 405, 408].
- [ ] [cite_start]**M7:** Multi-step Turbo Frame onboarding (Basics → Bio-Baseline → Language)[cite: 414, 416].

### Phase 3: Cycle Engine & Calendar (Days 5–7)
- [ ] [cite_start]`CycleCalculatorService`: Logic for 4-phase calculation based on user metrics[cite: 427, 428].
- [ ] [cite_start]**M2 Calendar UI:** Monthly grid with phase color-coding (Winter, Spring, Summer, Autumn)[cite: 434, 438].

### Phase 4: Tracking & Daily Forecast (Days 8–10)
- [ ] [cite_start]**M3 Tracking:** Expandable symptom sections with Stimulus auto-saving[cite: 450, 459].
- [ ] [cite_start]**M4 Daily View:** Forecast display with phase-specific tips and calendar overlays[cite: 463, 466].

### Phase 5: Reminders & Jobs (Days 11–12)
- [ ] [cite_start]**M5 Reminders:** CRUD for Supplement, Pill (21/7 logic), and Period alerts[cite: 472, 477].
- [ ] [cite_start]Hourly `ReminderDeliveryJob` via Solid Queue[cite: 483, 485].

### Phase 6: Admin & Monetization (Days 13–14)
- [ ] [cite_start]**M7 Admin:** Dashboard with Ransack search/filters and CSV export[cite: 488, 492, 495].
- [ ] [cite_start]**M8 Paywall:** Stripe Checkout integration and premium feature gating[cite: 499, 502, 509].

### Phase 7: Launch Prep (Days 15–17)
- [ ] [cite_start]Full QA on mobile browsers & Hotwire Native wrappers[cite: 510, 523].
- [ ] [cite_start]Migration Wave 2/3 email execution[cite: 530, 532].
- [ ] [cite_start]Production Go-Live & App Store submissions[cite: 538, 545].

---

## 🛠 Operational Guide

### Local Development
```bash
bin/dev              # Start Rails & Tailwind Watcher
bin/brakeman         # Run Security Audit
bundle exec rubocop  # Run Linting
Critical Path Constraints
I18n: Zero hardcoded strings. Use config/locales/en.yml and de.yml exclusively.


Scope Protection: If the timeline slips, cut M6 (Streaks) and M8 (Paywall) first.


Performance: No page should take more than 2s to load