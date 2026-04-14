# A/B Tests

---

## Test 1 — Login Button Placement

**User Story:** US2 – Login

### Metrics
- **Task Success** — Percentage of users who successfully log in
- **Engagement** — Number of successful login sessions

### Hypothesis
Some users may take longer to log in or hesitate if the login button is not clearly positioned near the fields they just entered. Improving login flow can make the app feel faster and easier to use. We believe that placing the login button directly below the password field will increase login success because it makes the next action clearer and easier to find.

### Experiment
Using Firebase A/B Testing, users will be randomly split:

| Group | Split |
|---|---|
| Control | 50% |
| Experiment | 50% |

**Firebase Analytics events tracked:**
- `login_attempt`
- `login_success`

Login success rate will be compared between versions.

### Variations

**Version A — Button at Bottom of Page**
Fields appear first, login button appears further down.

**Version B — Button Directly Under Password Field**
The login button appears immediately after the password field.

---

## Test 2 — NPS Prompt Format: Numeric Scale vs. Star Rating

**User Story:** US4 – User Engagement
> The NPS prompt triggers inside an authenticated session (every 3rd login), making it a sub-task of the engagement/retention user story rather than onboarding.

### Metrics (HEART)

| Dimension | Metric | Question |
|---|---|---|
| Happiness | NPS completion rate | Primary metric |
| Engagement | Session continuation after prompt | Does the modal interrupt flow? |
| Retention | Return rate next session | Does seeing a prompt affect churn? |

### Hypothesis

**Problem:** Campus Hustle needs reliable NPS data to track student satisfaction as the app grows. However, a traditional 0–10 scale can feel formal and cognitively heavy for a college-age audience already context-switching between classes, apps, and tasks. If the NPS prompt completion rate is low, the data skews toward outliers — only very satisfied or very frustrated students bother to respond — making the NPS score unreliable for product decisions. The bottleneck is not the question itself, but the perceived effort of the format.

**Hypothesis:** Replacing the 0–10 numeric scale with a 5-star tap input and casual, low-friction copy ("Quick question — how's your experience?") will increase prompt completion rate by at least 15%, without meaningfully distorting the sentiment signal. Only one variable changes: the input format and question copy. Trigger timing (every 3 logins), placement (bottom-sheet modal), and dismiss option remain identical across both variants.

### Experiment

**Audience split:** 50% Variant A / 50% Variant B via Firebase Remote Config. A 50/50 split is appropriate at this stage because the user base is small — a smaller holdout would extend time to significance. Assignment is done on first app open post-launch and persisted to Firestore by UID for cross-device consistency.

**Firebase Analytics events tracked:**
- `nps_prompt_shown`
- `nps_prompt_dismissed` (with variant param)
- `nps_score_submitted` (with variant + normalized score 0–10)
- `session_continued_after_nps` (user navigates within 60s of modal closing)

**Success threshold:** Run until each variant has 200+ completed NPS responses or 3 weeks, whichever comes first. Star scores map to 0–10 scale (1★ = 0, 3★ = 5, 5★ = 10) for direct comparison.

---

## Test 3 — Service Discovery vs. Peer-to-Peer Posting

**User Story:** US3 – Service Discovery / Peer-to-Peer Marketplace

### Metrics (HEART)
- **Engagement** — Post-to-Browse ratio (how many students who look at URI official services decide to offer their own)
- **Retention** — 7-day return rate (do students come back to check for new peer services?)

### Hypothesis

**Problem:** We have high DAU for students looking up "URI Official Services" (like advising or dining), but very low participation in the "Student-to-Student" service section (cooking, tutoring, etc.). Students see the app as a "Directory" rather than a "Community."

**Hypothesis:** If we add a "What can you offer?" call-to-action (CTA) banner at the bottom of official URI service pages, we will increase student-led postings by 20%. By nudging them while they are already looking for help, they will realize they can also provide help.

### Experiment

**Setup:** Firebase Remote Config to toggle the visibility of the "Offer a Service" banner.

**Audience:** 25% of URI students. Starting small to avoid cluttering official URI information pages if it annoys users who are just looking for office hours.

**Firebase Analytics events tracked:**
- `click_cta_offer_service` — tracked when the banner is clicked
- `post_created` — tracked when a student successfully submits a cooking/tutoring/etc. post

### Variations

**Variation A — Control**
The "Official Services" page lists URI department info only (e.g., Campus Recreation info).

**Variation B — Test**
The "Official Services" page includes a sticky footer or card at the bottom:
> "Need help with something else? See what your fellow Rams are offering or [Post your own service]!"
