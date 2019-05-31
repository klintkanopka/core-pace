library(plm)
library(stargazer)
conflict_prefer("lag", "plm")

# smarter balanced ELA

d <- tests %>%
  select(student_id, cds, district, school_year, 
         tests_rectype, tests_scalescore, tests_level) %>%
  filter(tests_rectype == 1) %>%
  inner_join(student_sel_d, by=merge_cond) %>%
  group_by(school_year, enrl_grade) %>%
  mutate(ela_sbac_std = scale(tests_scalescore)) %>%
  ungroup() %>%
  distinct(student_id, school_year, .keep_all = TRUE) %>%
  pdata.frame(index=c("student_id", "school_year"), 
              drop.index = TRUE, row.names=TRUE)

source("ela_gm.R")
stargazer(model_1_t1, 
          model_2_t1, 
          model_3_t1, 
          model_4_t1, 
          #se= list(m1_t1_se,
          #         m2_t1_se,
          #         m3_t1_se,
          #         m4_t1_se),
          header=F,
          type="text",
          out=ela_gm_tab,
          title="Growth Mindset and SBAC ELA",
          covariate.labels=c("$SEL_{GM,t-1}$",
                             "$SEL_{GM,t-2}$", 
                             "$TEST_{t-1}$",
                             "$TEST_{t-2}$",
                             ""
          ),
          omit=6:326,
          omit.stat = "f",
          dep.var.labels.include = FALSE,
          dep.var.caption = "Standardized Test Score",
          add.lines=list(c("Individual Fixed Effects", "X", "", "", ""),
                         c("School Fixed Effects", "", "", "", "X"))
)

source("ela_sa.R")
stargazer(model_1_t1, 
          model_2_t1, 
          model_3_t1, 
          model_4_t1, 
          #se= list(m1_t1_se,
          #         m2_t1_se,
          #         m3_t1_se,
          #         m4_t1_se),
          header=F,
          type="text",
          out=ela_sa_tab,
          title="Social Awareness and SBAC ELA",
          covariate.labels=c("$SEL_{SA,t-1}$",
                             "$SEL_{SA,t-2}$", 
                             "$TEST_{t-1}$",
                             "$TEST_{t-2}$",
                             ""
          ),
          omit=6:326,
          omit.stat = "f",
          dep.var.labels.include = FALSE,
          dep.var.caption = "Standardized Test Score",
          add.lines=list(c("Individual Fixed Effects", "X", "", "", ""),
                         c("School Fixed Effects", "", "", "", "X"))
)

source("ela_se.R")
stargazer(model_1_t1, 
          model_2_t1, 
          model_3_t1, 
          model_4_t1, 
          #se= list(m1_t1_se,
          #         m2_t1_se,
          #         m3_t1_se,
          #         m4_t1_se),
          header=F,
          type="text",
          out=ela_se_tab,
          title="Self Efficacy and SBAC ELA",
          covariate.labels=c("$SEL_{SE,t-1}$",
                             "$SEL_{SE,t-2}$", 
                             "$TEST_{t-1}$",
                             "$TEST_{t-2}$",
                             ""
          ),
          omit=6:326,
          omit.stat = "f",
          dep.var.labels.include = FALSE,
          dep.var.caption = "Standardized Test Score",
          add.lines=list(c("Individual Fixed Effects", "X", "", "", ""),
                         c("School Fixed Effects", "", "", "", "X"))
)

source("ela_sm.R")
stargazer(model_1_t1, 
          model_2_t1, 
          model_3_t1, 
          model_4_t1, 
          #se= list(m1_t1_se,
          #         m2_t1_se,
          #         m3_t1_se,
          #         m4_t1_se),
          header=F,
          type="text",
          out=ela_sm_tab,
          title="Self Management and SBAC ELA",
          covariate.labels=c("$SEL_{SM,t-1}$",
                             "$SEL_{SM,t-2}$", 
                             "$TEST_{t-1}$",
                             "$TEST_{t-2}$",
                             ""
          ),
          omit=6:326,
          omit.stat = "f",
          dep.var.labels.include = FALSE,
          dep.var.caption = "Standardized Test Score",
          add.lines=list(c("Individual Fixed Effects", "X", "", "", ""),
                         c("School Fixed Effects", "", "", "", "X"))
)

rm(d)