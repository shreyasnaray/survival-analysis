Project Title
Evaluating Time-to-Event Outcomes Using Kaplan-Meier Curves and Cox Proportional Hazards Models

Business Case
A clinical research team wants to understand whether a new test treatment improves patient survival compared with standard treatment.
The team has patient-level survival data, including treatment group, survival time, event status, age, Karnofsky performance score, and prior therapy status.
The goal is to answer:
Does the test treatment improve survival time compared with standard treatment, after accounting for patient health status and age?
This project uses survival analysis methods, including Kaplan-Meier curves, log-rank testing, Cox proportional hazards regression, proportional hazards diagnostics, and interaction modeling.

Problem
In many healthcare problems, the outcome is not simply whether something happened, but when it happened.
In this dataset, the outcome is survival time.
A regular linear regression model would not be appropriate because:
Some patients may survive longer than the study period.
Some patients may be censored.
The outcome is time-to-event, not a normal continuous outcome.
Risk changes over time.
The key business/statistical question is:
Is the test treatment associated with longer survival compared with standard treatment?
Secondary questions:
Do survival curves differ by treatment group?
Does treatment still matter after adjusting for age and Karnofsky score?
Is patient baseline health more predictive than treatment assignment?
Does the treatment effect vary by age?

Dataset
veteran
The veteran dataset contains survival data from a lung cancer clinical trial.

Key Findings
Finding 1: Kaplan-Meier curves provide the first look at treatment differences
The Kaplan-Meier plot gives a visual comparison of survival between the standard and test treatment groups.
If the test treatment curve stays above the standard treatment curve, that suggests better survival in the test group.
If the curves overlap heavily, that suggests limited survival separation.
Business takeaway: The Kaplan-Meier curve is the best first visual for communicating treatment survival differences.

Finding 2: The log-rank test compares survival curves, but does not adjust for patient mix
The log-rank test checks whether treatment groups have different survival curves.
However, it does not adjust for baseline patient characteristics.
That means a treatment difference could be confounded by:
Age
Karnofsky score
Cell type
Prior therapy
Other clinical differences
Business takeaway: The log-rank test tells us whether curves differ, but not whether treatment independently explains the difference.

Finding 3: Cox regression gives an adjusted estimate of treatment effect
The Cox model adjusts for age and Karnofsky score: This lets us estimate treatment effect while holding patient age and health status constant.
Business takeaway: The Cox model is more decision-useful than a raw treatment comparison because it adjusts for patient risk.

Finding 4: Karnofsky score is likely a major driver of survival
The inclusion of karno is important because it captures baseline health status.
A higher Karnofsky score usually indicates better functioning.
In many survival models, baseline performance status is highly predictive of survival.
Business takeaway: Patient health at baseline may explain survival differences more strongly than treatment assignment alone.

Finding 5: Treatment may not be equally effective across age groups
The interaction model tests:
trt * age
This asks whether the test treatment has different survival effects for younger versus older patients.
Business takeaway: A treatment may have different value for different patient segments.

Surprising Insights
Insight 1: Treatment may not be the strongest predictor
A common assumption is that treatment group will dominate the survival model.
However, in clinical survival data, baseline health measures like Karnofsky score can be more predictive than treatment.
Surprising takeaway: Who the patient is at baseline may matter more than which treatment they receive.

Insight 2: A survival histogram can be misleading
The histogram of survival time by treatment is useful for exploration, but it does not fully account for censoring.
Two groups can have similar-looking histograms but different Kaplan-Meier curves.
Surprising takeaway: In survival analysis, the shape of observed times is not the same as the survival curve.

Insight 3: A non-significant treatment effect does not always mean the treatment is useless
If treatment is not statistically significant in the Cox model, that may mean several things:
The treatment truly has limited effect.
The sample size is too small.
The treatment works only for certain subgroups.
The treatment effect changes over time.
Strong baseline risk factors explain most of the survival variation.
Surprising takeaway: A weak average treatment effect may hide a stronger effect in a specific patient subgroup.

Insight 4: The proportional hazards test can change the story
If the proportional hazards assumption fails, then a single hazard ratio may oversimplify the treatment effect.
For example, treatment may reduce risk early but not later.
Surprising takeaway: One hazard ratio may not be enough if the treatment effect changes over time.

Insight 5: The interaction model asks a more business-relevant question
The basic model asks:
Does treatment work on average?
The interaction model asks:
For whom does treatment work better?
That second question is often more useful for clinical decision-making.
Surprising takeaway: The best treatment strategy may depend on patient segmentation, not just average performance.

Metric Story
Metric: Hazard Ratio for Treatment

The key metric is the treatment hazard ratio from the Cox model.

What metric changed?
The metric changes from a simple survival curve comparison to an adjusted treatment hazard ratio.
Before Cox modeling, the main comparison is:
Do the Kaplan-Meier curves look different?
After Cox modeling, the comparison becomes:
Does the test treatment reduce or increase the hazard of death after adjusting for age and Karnofsky score?

Why did it change?
The metric changed because the analysis moved from unadjusted survival comparison to adjusted survival modeling.
The Kaplan-Meier curve and log-rank test compare treatment groups directly.
The Cox model adjusts for patient risk factors.
Business translation: The Cox model asks whether treatment matters after accounting for who the patients are.

What caused it?
The adjusted hazard ratio may differ from the unadjusted treatment comparison because of patient mix.
For example, if the test treatment group has patients with lower Karnofsky scores, they may appear to have worse survival even if the treatment itself is not harmful.
Or if the test group has healthier patients, the treatment may look better than it really is.
The major drivers are:
Treatment assignment
Age
Karnofsky performance score
Potential interaction between treatment and age
Possible censoring patterns

Business Impact
Clinical Impact
This project helps a clinical team decide whether the test treatment is associated with better survival.
It supports decisions such as:
Whether to continue evaluating the treatment.
Whether to target the treatment to certain patient groups.
Whether baseline health status should be used for risk stratification.
Whether more clinical trials or subgroup analyses are needed.

Operational Impact

If the test treatment is associated with lower hazard, the organization may consider:
Expanding access to the treatment.
Designing a larger confirmatory trial.
Prioritizing similar treatments for development.
Monitoring safety and survival outcomes over time.

If the test treatment is not associated with lower hazard, the organization may consider:

Reassessing whether the treatment should continue.
Investigating whether it helps specific subgroups.
Studying whether patient selection criteria need refinement.
Comparing treatment costs against limited survival benefit.

Recommendation 1: Include Karnofsky score in the final model

Karnofsky score is clinically important and likely captures baseline patient condition.
Removing it could make treatment estimates misleading.
Business recommendation: Always adjust for baseline health when comparing survival outcomes.

Recommendation 2: Check proportional hazards before making final claims

If the proportional hazards assumption fails, consider:
Stratified Cox models
Time-varying coefficients
Adding interaction with time
Reporting survival probabilities at fixed time points instead of one overall hazard ratio

Recommendation 3: Test whether treatment works differently by age

If the interaction improves model fit, report treatment effects separately for younger and older patients.

Executive Summary
This project evaluates survival outcomes in a lung cancer clinical trial dataset using Kaplan-Meier curves, log-rank tests, and Cox proportional hazards regression.
The Kaplan-Meier curves provide an intuitive comparison of survival over time between standard and test treatment groups. The log-rank test checks whether the survival curves differ. The Cox model improves the analysis by adjusting for age and Karnofsky performance score.
The most important business insight is that treatment comparisons should not be interpreted without accounting for baseline patient health. Karnofsky score may explain a large portion of survival differences, meaning that patient condition at baseline can be as important as treatment group.
The treatment hazard ratio is the key metric. It tells us whether the test treatment is associated with higher or lower risk of death after adjusting for patient characteristics.

Final Recommendation

Use the adjusted Cox proportional hazards model as the main decision-making model:
coxph(Surv(time, status) ~ trt + age + karno, data = veteran)
Report the treatment hazard ratio, confidence interval, Kaplan-Meier plot, log-rank test, and proportional hazards diagnostics.
The final business message is: The test treatment should be evaluated not only by whether its survival curve looks better, but by whether it lowers adjusted hazard after accounting for age and baseline patient health. Patient risk stratification is essential before making treatment recommendations.









































