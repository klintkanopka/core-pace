library(stargazer)

stargazer(model_1_t1, 
          model_2_t1, 
          model_3_t1, 
          model_4_t1, 
          se= list(m1_t1_se,
                   m2_t1_se,
                   m3_t1_se,
                   m4_t1_se),
          header=F,
          title="Smarter Balanced ELA",
          covariate.labels=c("$SEL_{GM,t-1}$",
                             "$SEL_{SA,t-1}$",
                             "$SEL_{SE,t-1}$",
                             "$SEL_{SM,t-1}$",
                             "$SEL_{GM,t-2}$", 
                             "$SEL_{SA,t-2}$",
                             "$SEL_{SE,t-2}$",
                             "$SEL_{SM,t-2}$",
                             "$TEST_{t-1}$",
                             "$TEST_{t-2}$"
          ),
          omit.stat = "f",
          dep.var.labels.include = FALSE,
          dep.var.caption = "Scaled Test Score",
          add.lines=list(c("Individual Fixed Effects", "X", "", "", ""))
)



stargazer(model_1_t2, 
          model_2_t2, 
          model_3_t2, 
          model_4_t2, 
          se= list(m1_t2_se,
                   m2_t2_se,
                   m3_t2_se,
                   m4_t2_se),
          header=F,
          title="Smarter Balanced Math",
          covariate.labels=c("$SEL_{GM,t-1}$",
                             "$SEL_{SA,t-1}$",
                             "$SEL_{SE,t-1}$",
                             "$SEL_{SM,t-1}$",
                             "$SEL_{GM,t-2}$", 
                             "$SEL_{SA,t-2}$",
                             "$SEL_{SE,t-2}$",
                             "$SEL_{SM,t-2}$",
                             "$TEST_{t-1}$",
                             "$TEST_{t-2}$"
          ),
          omit.stat = "f",
          dep.var.labels.include = FALSE,
          dep.var.caption = "Scaled Test Score",
          add.lines=list(c("Individual Fixed Effects", "X", "", "", ""))
)
