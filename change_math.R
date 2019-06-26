library(plm)
library(stargazer)

# change on change
m_gm <- lm(d_sbac_math ~ d_sela_gm, data=d_plm)
m_sa <- lm(d_sbac_math ~ d_sela_sa, data=d_plm)
m_se <- lm(d_sbac_math ~ d_sela_se, data=d_plm)
m_sm <- lm(d_sbac_math ~ d_sela_sm, data=d_plm)

# change on change, with individual FE
mfe_gm <- plm(d_sbac_math ~ d_sela_gm, data=d_plm, model="within")
mfe_sa <- plm(d_sbac_math ~ d_sela_sa, data=d_plm, model="within")
mfe_se <- plm(d_sbac_math ~ d_sela_se, data=d_plm, model="within")
mfe_sm <- plm(d_sbac_math ~ d_sela_sm, data=d_plm, model="within")

# change on lagged change
m2_gm <- lm(d_sbac_math ~ d2_sela_gm, data=d_plm)
m2_sa <- lm(d_sbac_math ~ d2_sela_sa, data=d_plm)
m2_se <- lm(d_sbac_math ~ d2_sela_se, data=d_plm)
m2_sm <- lm(d_sbac_math ~ d2_sela_sm, data=d_plm)

# change on change, control for lagged change
mb_gm <- lm(d_sbac_math ~ d_sela_gm + d2_sela_gm, data=d_plm)
mb_sa <- lm(d_sbac_math ~ d_sela_sa + d2_sela_sa, data=d_plm)
mb_se <- lm(d_sbac_math ~ d_sela_se + d2_sela_se, data=d_plm)
mb_sm <- lm(d_sbac_math ~ d_sela_sm + d2_sela_sm, data=d_plm)

stargazer(m_gm, 
          mfe_gm, 
          m2_gm, 
          mb_gm, 
          #se= list(m1_t1_se,
          #         m2_t1_se,
          #         m3_t1_se,
          #         m4_t1_se),
          header=F,
          type="text",
          model.names=F,
          out=delta_math_gm_tab,
          title="Growth Mindset and SBAC Math",
          covariate.labels=c("$\\Delta SEL_{GM,t,t-1}$",
                             "$\\Delta SEL_{GM,t-1,t-2}$"
          ),
          #omit=6:326,
          omit.stat = "f",
          dep.var.labels.include=F,
          dep.var.caption = "$\\Delta SBAC_{math,t,t-1}$",
          add.lines=list(c("Individual Fixed Effects", "", "X", "", ""))
)

stargazer(m_sa, 
          mfe_sa, 
          m2_sa, 
          mb_sa, 
          #se= list(m1_t1_se,
          #         m2_t1_se,
          #         m3_t1_se,
          #         m4_t1_se),
          header=F,
          type="text",
          model.names=F,
          out=delta_math_sa_tab,
          title="Social Awareness and SBAC Math",
          covariate.labels=c("$\\Delta SEL_{SA,t,t-1}$",
                             "$\\Delta SEL_{SA,t-1,t-2}$"
          ),
          #omit=6:326,
          omit.stat = "f",
          dep.var.labels.include=F,
          dep.var.caption = "$\\Delta SBAC_{math,t,t-1}$",
          add.lines=list(c("Individual Fixed Effects", "", "X", "", ""))
)

stargazer(m_se, 
          mfe_se, 
          m2_se, 
          mb_se, 
          #se= list(m1_t1_se,
          #         m2_t1_se,
          #         m3_t1_se,
          #         m4_t1_se),
          header=F,
          type="text",
          model.names=F,
          out=delta_math_se_tab,
          title="Self Efficacy and SBAC Math",
          covariate.labels=c("$\\Delta SEL_{SE,t,t-1}$",
                             "$\\Delta SEL_{SE,t-1,t-2}$"
          ),
          #omit=6:326,
          omit.stat = "f",
          dep.var.labels.include=F,
          dep.var.caption = "$\\Delta SBAC_{math,t,t-1}$",
          add.lines=list(c("Individual Fixed Effects", "", "X", "", ""))
)

stargazer(m_sm, 
          mfe_sm, 
          m2_sm, 
          mb_sm, 
          #se= list(m1_t1_se,
          #         m2_t1_se,
          #         m3_t1_se,
          #         m4_t1_se),
          header=F,
          type="text",
          model.names=F,
          out=delta_math_sm_tab,
          title="Self Management and SBAC Math",
          covariate.labels=c("$\\Delta SEL_{SM,t,t-1}$",
                             "$\\Delta SEL_{SM,t-1,t-2}$"
          ),
          #omit=6:326,
          omit.stat = "f",
          dep.var.labels.include=F,
          dep.var.caption = "$\\Delta SBAC_{math,t,t-1}$",
          add.lines=list(c("Individual Fixed Effects", "", "X", "", ""))
)
