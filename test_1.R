# smarter balanced ELA
library(plm)
conflict_prefer("lag", "plm")

d <- tests %>%
  select(student_id, cds, district, school_year, 
         tests_rectype, tests_scalescore, tests_level) %>%
  filter(tests_rectype == 1) %>%
  inner_join(student_sel_d, by=merge_cond) %>%
  distinct(student_id, school_year, .keep_all = TRUE) %>%
  pdata.frame(index=c("student_id", "school_year"), 
                     drop.index = TRUE, row.names=TRUE)

# fixed effects model
# TestScores(t) = SEL(t-1) + StudentFE 

spec_1 <- "tests_scalescore ~ lag(sela_scalescore_gm_pcm, 1) + lag(sela_scalescore_sa_pcm, 1) + lag(sela_scalescore_se_pcm, 1) + lag(sela_scalescore_sm_pcm, 1)"
model_1_t1 <- plm(as.formula(spec_1), data = d, model="within")
m1_t1_se <- sqrt(diag(vcovHC(model_1_t1, type="HC0", cluster="group")))

# 1st model from marty et al.
# TestScores(t) = SEL(t-1) + SEL(t-2) + TestScores(t-2)  

spec_2 <- "tests_scalescore ~ lag(sela_scalescore_gm_pcm, 1) + lag(sela_scalescore_sa_pcm, 1) + lag(sela_scalescore_se_pcm, 1) + lag(sela_scalescore_sm_pcm, 1) + lag(sela_scalescore_gm_pcm, 2) + lag(sela_scalescore_sa_pcm, 2) + lag(sela_scalescore_se_pcm, 2) + lag(sela_scalescore_sm_pcm, 2) + lag(tests_scalescore, 2)"
model_2_t1 <- plm(as.formula(spec_2), data = d, model="pooling")
m2_t1_se <- sqrt(diag(vcovHC(model_2_t1, type="HC0", cluster="group")))

# 2nd model from marty et al.
# TestScores(t) = SEL(t-1) + SEL(t-2) + TestScores(t-1) + TestScores(t-2) 

spec_3 <- "tests_scalescore ~ lag(sela_scalescore_gm_pcm, 1) + lag(sela_scalescore_sa_pcm, 1) + lag(sela_scalescore_se_pcm, 1) + lag(sela_scalescore_sm_pcm, 1) + lag(sela_scalescore_gm_pcm, 2) + lag(sela_scalescore_sa_pcm, 2) + lag(sela_scalescore_se_pcm, 2) + lag(sela_scalescore_sm_pcm, 2) + lag(tests_scalescore, 1) + lag(tests_scalescore, 2)"
model_3_t1 <- plm(as.formula(spec_3), data = d, model="pooling")
m3_t1_se <- sqrt(diag(vcovHC(model_3_t1, type="HC0", cluster="group")))

# model from susana & susanna
# TestScores(t) = SEL(t-1) + TestScores(t-1) + TestScores(t-2) 

spec_4 <- "tests_scalescore ~ lag(sela_scalescore_gm_pcm, 1) + lag(sela_scalescore_sa_pcm, 1) + lag(sela_scalescore_se_pcm, 1) + lag(sela_scalescore_sm_pcm, 1) + lag(tests_scalescore, 1) + lag(tests_scalescore, 2)"
model_4_t1 <- plm(as.formula(spec_4), data = d, model="pooling")
m4_t1_se <- sqrt(diag(vcovHC(model_4_t1, type="HC0", cluster="group")))

rm(d)
