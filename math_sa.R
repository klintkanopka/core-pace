# fixed effects model
# TestScores(t) = SEL(t-1) + StudentFE 

spec_1 <- "math_sbac_std ~ lag(sela_sa_std, 1)"
model_1_t1 <- plm(as.formula(spec_1), data = d, model="within")
#m1_t1_se <- sqrt(diag(vcovHC(model_1_t1, type="HC0", cluster="group")))

# 1st model from marty et al.
# TestScores(t) = SEL(t-1) + SEL(t-2) + TestScores(t-2)  

spec_2 <- "math_sbac_std ~ lag(sela_sa_std, 1) + lag(sela_sa_std, 2) + lag(math_sbac_std, 2)"
model_2_t1 <- plm(as.formula(spec_2), data = d, model="pooling")
#m2_t1_se <- sqrt(diag(vcovHC(model_2_t1, type="HC0", cluster="group")))

# 2nd model from marty et al.
# TestScores(t) = SEL(t-1) + SEL(t-2) + TestScores(t-1) + TestScores(t-2) 

spec_3 <- "math_sbac_std ~ lag(sela_sa_std, 1) + lag(sela_sa_std, 2) + lag(math_sbac_std, 1) + lag(math_sbac_std, 2)"
model_3_t1 <- plm(as.formula(spec_3), data = d, model="pooling")
#m3_t1_se <- sqrt(diag(vcovHC(model_3_t1, type="HC0", cluster="group")))

# model from susana & susanna
# TestScores(t) = SEL(t-1) + TestScores(t-1) + TestScores(t-2) 

spec_4 <- "math_sbac_std ~ lag(sela_sa_std, 1) + lag(math_sbac_std, 1) + lag(math_sbac_std, 2) + as.factor(cds)"
model_4_t1 <- plm(as.formula(spec_4), data = d, model="pooling")
#m4_t1_se <- sqrt(diag(vcovHC(model_4_t1, type="HC0", cluster="group")))
