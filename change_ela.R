library(plm)
library(stargazer)

# change on change
e_gm <- lm(d_sbac_ela ~ d_sela_gm, data=d_plm)
e_sa <- lm(d_sbac_ela ~ d_sela_sa, data=d_plm)
e_se <- lm(d_sbac_ela ~ d_sela_se, data=d_plm)
e_sm <- lm(d_sbac_ela ~ d_sela_sm, data=d_plm)

# change on change, with individual FE
efe_gm <- plm(d_sbac_ela ~ d_sela_gm, data=d_plm, model="within")
efe_sa <- plm(d_sbac_ela ~ d_sela_sa, data=d_plm, model="within")
efe_se <- plm(d_sbac_ela ~ d_sela_se, data=d_plm, model="within")
efe_sm <- plm(d_sbac_ela ~ d_sela_sm, data=d_plm, model="within")

# change on lagged change
e2_gm <- lm(d_sbac_ela ~ d2_sela_gm, data=d_plm)
e2_sa <- lm(d_sbac_ela ~ d2_sela_sa, data=d_plm)
e2_se <- lm(d_sbac_ela ~ d2_sela_se, data=d_plm)
e2_sm <- lm(d_sbac_ela ~ d2_sela_sm, data=d_plm)

# change on change, control for lagged change
eb_gm <- lm(d_sbac_ela ~ d_sela_gm + d2_sela_gm, data=d_plm)
eb_sa <- lm(d_sbac_ela ~ d_sela_sa + d2_sela_sa, data=d_plm)
eb_se <- lm(d_sbac_ela ~ d_sela_se + d2_sela_se, data=d_plm)
eb_sm <- lm(d_sbac_ela ~ d_sela_sm + d2_sela_sm, data=d_plm)


stargazer(e_gm, 
          efe_gm, 
          e2_gm, 
          eb_gm, 
          #se= list(m1_t1_se,
          #         m2_t1_se,
          #         m3_t1_se,
          #         m4_t1_se),
          header=F,
          type="text",
          model.names=F,
          out=delta_ela_gm_tab,
          title="Growth Mindset and SBAC ELA",
          covariate.labels=c("$\\Delta SEL_{GM,t,t-1}$",
                             "$\\Delta SEL_{GM,t-1,t-2}$"
          ),
          #omit=6:326,
          omit.stat = "f",
          dep.var.labels.include=F,
          dep.var.caption = "$\\Delta SBAC_{ELA,t,t-1}$",
          add.lines=list(c("Individual Fixed Effects", "", "X", "", ""))
)

stargazer(e_sa, 
          efe_sa, 
          e2_sa, 
          eb_sa, 
          #se= list(m1_t1_se,
          #         m2_t1_se,
          #         m3_t1_se,
          #         m4_t1_se),
          header=F,
          type="text",
          model.names=F,
          out=delta_ela_sa_tab,
          title="Social Awareness and SBAC ELA",
          covariate.labels=c("$\\Delta SEL_{SA,t,t-1}$",
                             "$\\Delta SEL_{SA,t-1,t-2}$"
          ),
          #omit=6:326,
          omit.stat = "f",
          dep.var.labels.include=F,
          dep.var.caption = "$\\Delta SBAC_{ELA,t,t-1}$",
          add.lines=list(c("Individual Fixed Effects", "", "X", "", ""))
)

stargazer(e_se, 
          efe_se, 
          e2_se, 
          eb_se, 
          #se= list(m1_t1_se,
          #         m2_t1_se,
          #         m3_t1_se,
          #         m4_t1_se),
          header=F,
          type="text",
          model.names=F,
          out=delta_ela_se_tab,
          title="Self Efficacy and SBAC ELA",
          covariate.labels=c("$\\Delta SEL_{SE,t,t-1}$",
                             "$\\Delta SEL_{SE,t-1,t-2}$"
          ),
          #omit=6:326,
          omit.stat = "f",
          dep.var.labels.include=F,
          dep.var.caption = "$\\Delta SBAC_{ELA,t,t-1}$",
          add.lines=list(c("Individual Fixed Effects", "", "X", "", ""))
)

stargazer(e_sm, 
          efe_sm, 
          e2_sm, 
          eb_sm, 
          #se= list(m1_t1_se,
          #         m2_t1_se,
          #         m3_t1_se,
          #         m4_t1_se),
          header=F,
          type="text",
          model.names=F,
          out=delta_ela_sm_tab,
          title="Self Management and SBAC ELA",
          covariate.labels=c("$\\Delta SEL_{SM,t,t-1}$",
                             "$\\Delta SEL_{SM,t-1,t-2}$"
          ),
          #omit=6:326,
          omit.stat = "f",
          dep.var.labels.include=F,
          dep.var.caption = "$\\Delta SBAC_{ELA,t,t-1}$",
          add.lines=list(c("Individual Fixed Effects", "", "X", "", ""))
)
