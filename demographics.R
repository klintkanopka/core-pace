library(tidyverse)

tmp <- student_sel_d %>%
  group_by(school_year) %>%
  summarize(
    percent_male = mean(stu_gender == 2, na.rm=T)*100,
    
    percent_african_american = mean(stu_aa, na.rm=T)*100,
    percent_hispanic = mean(stu_hi, na.rm=T)*100,
    percent_asian = mean(stu_as, na.rm=T)*100,
    percent_white = mean(stu_wh, na.rm=T)*100,
  
    percent_frpl = mean(stua_sd_frpl, na.rm=T)*100,
    percent_homeless = mean(stua_hl, na.rm=T)*100,
    percent_disabled = mean(stua_swd, na.rm=T)*100,
    percent_el = mean(stua_el, na.rm=T)*100,
    percent_abs = mean(att_daysabs/att_daysenr, na.rm=T)*100,
    n = n()
  )

tmp <- t(tmp)[-1,]
colnames(tmp) <- c("SY15", "SY16", "SY17")
rownames(tmp) <- c("Percent Male",
                   "Percent African American",
                   "Percent Hispanic",
                   "Percent Asian",
                   "Percent White",
                   "Percent Free/Reduced Price Lunch",
                   "Percent Homeless",
                   "Percent Students with Disabilities",
                   "Percent English Learners",
                   "Average Percent Days Absent",
                   "n")

stargazer(tmp, out=demo_tab, 
          title="Demographic and Academic Indicators by School Year",
          summary=FALSE, type="text", digits=2)
