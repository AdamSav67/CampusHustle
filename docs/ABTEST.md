Login Button Placement Test

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
