library(survival)
library(ggplot2)
veteran$trt <- factor(veteran$trt, labels = c('standard', 'test'))
veteran$prior <- factor(veteran$prior, labels = c('no', 'yes'))
ggplot(data = veteran, aes(x = time, fill = trt)) + 
  geom_histogram() + 
  facet_grid(trt ~.) + 
  ggtitle('Figure 1. Distribution of time-to-event by treatment')

ggplot(data = veteran, aes(x = karno, fill = celltype)) +
  geom_histogram() +
  ggtitle('Figure 2. Type of karno per cell type')

fit1 <- survfit(Surv(time, status) ~ trt, data = veteran)

# log-rank test compares the survival curves between groups
survdiff(Surv(time, status) ~ trt, data = veteran)
ggsurvplot(fit1,
           data = veteran,
           pval = TRUE,
           conf.int = TRUE,
           risk.table = 'abs_pct',
           ggtheme = theme_minimal(),
           title = 'Kaplan-Meier Survival Curves by Treatment Group')

cox_model <- coxph(Surv(time, status) ~ trt + age + karno, data = veteran)
cbind(HR = coef(cox_model), confint(cox_model))

ph_test <- cox.zph(cox_model)
ph_test
plot(ph_test)

coxph(Surv(time, status) ~ trt * age + karno, data = veteran)


































