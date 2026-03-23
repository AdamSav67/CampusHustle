__Login Button Placement Test__

User Story Number:
US2 – Login

Metrics:
Task Success: Percentage of users who successfully log in

Engagement: Number of successful login sessions

Hypothesis:
Some users may take longer to log in or hesitate if the login button is not clearly positioned near the fields they just entered. Improving login flow can make the app feel faster and easier to use. We believe that placing the login button directly below the password field will increase login success because it makes the next action clearer and easier to find.

Experiment:
Using Firebase A/B Testing, users will be randomly split:

50% Control

50% Experiment

Firebase Analytics Tracking

Events tracked:
login_attempt
login_success

Login success rate will be compared between versions.

Variations:
Version A – Button at Bottom of Page
Fields appear first, login button appears further down.

Version B – Button Directly Under Password Field
The login button appears immediately after the password field.

__NPS prompt — numeric scale vs. star rating__
<br>
US4 — User Engagement The NPS prompt triggers inside an authenticated session (every 3rd login), making it a sub-task of the engagement/retention user story rather than onboarding.
Metrics — HEART
Happiness
NPS completion rate
Primary metric
Engagement
Session continuation after prompt
Does the modal interrupt flow?
Retention
Return rate next session
Does seeing a prompt affect churn?
Hypothesis

Problem: Campus Hustle needs reliable NPS data to track student satisfaction as the app grows. However, a traditional 0–10 scale can feel formal and cognitively heavy for a college-age audience already context-switching between classes, apps, and tasks. If the NPS prompt completion rate is low, the data skews toward outliers — only very satisfied or very frustrated students bother to respond — making the NPS score unreliable for product decisions. The bottleneck is not the question itself, but the perceived effort of the format.

Hypothesis: Replacing the 0–10 numeric scale with a 5-star tap input and casual, low-friction copy ("Quick question — how's your experience?") will increase prompt completion rate by at least 15%, without meaningfully distorting the sentiment signal. Only one variable changes: the input format and question copy. Trigger timing (every 3 logins), placement (bottom-sheet modal), and dismiss option remain identical across both variants.
Experiment setup
Audience split: 50% Variant A / 50% Variant B via Firebase Remote Config. A 50/50 split is appropriate at this stage because the user base is small — a smaller holdout would extend time to significance. Assignment is done on first app open post-launch and persisted to Firestore by UID for cross-device consistency.
Firebase Analytics events to track: nps_prompt_shown, nps_prompt_dismissed (with variant param), nps_score_submitted (with variant + normalized score 0–10), session_continued_after_nps (user navigates within 60s of modal closing).
Success threshold: Run until each variant has 200+ completed NPS responses or 3 weeks, whichever comes first. Star scores map to 0–10 scale (1★ = 0, 3★ = 5, 5★ = 10) for direct comparison.

