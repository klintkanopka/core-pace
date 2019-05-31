d1 <- tests %>%
  select(student_id, cds, district, school_year, 
         tests_rectype, tests_scalescore, tests_level) %>%
  filter(tests_rectype == 1) %>%
  distinct(student_id, school_year, .keep_all = TRUE) %>%
  mutate(SBAC_ELA = tests_scalescore)

d2 <- tests %>%
  select(student_id, cds, district, school_year, 
         tests_rectype, tests_scalescore, tests_level) %>%
  filter(tests_rectype == 2) %>%
  distinct(student_id, school_year, .keep_all = TRUE) %>%
  mutate(SBAC_Math = tests_scalescore)

tmp <- d1 %>%
  inner_join(d2, by=merge_cond) %>%
  inner_join(sela_scales, by=merge_cond) %>%
  inner_join(enrl, by=c("student_id", "school_year")) %>%
  filter(enrl_grade %in% c(4,5,6,7)) %>%
  group_by(school_year, enrl_grade) %>%
  summarize(GM = mean(sela_truescore_gm_pcm, na.rm=T),
            SA = mean(sela_truescore_sa_pcm, na.rm=T),
            SE = mean(sela_truescore_se_pcm, na.rm=T),
            SM = mean(sela_truescore_se_pcm, na.rm=T),
            SBAC_ELA = mean(SBAC_ELA, na.rm=T),
            SBAC_Math = mean(SBAC_Math, na.rm=T),
            n = n())

stargazer(round(tmp,2), summary=FALSE, 
          title="Score Means by Cohort-Year",
          out=means_tab, type="text", digits=2)
