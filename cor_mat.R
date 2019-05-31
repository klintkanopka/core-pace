library(stargazer)

d <- tests %>%
  select(student_id, cds, district, school_year, 
         tests_rectype, tests_scalescore, tests_level) %>%
  filter(tests_rectype == 1) %>%
  inner_join(student_sel_d, by=merge_cond) %>%
  distinct(student_id, school_year, .keep_all = TRUE)


tmp_15 <- d %>%
  filter(school_year == 15) %>%
  transmute(
    student_id = student_id,
    sela_gm_std_15 = sela_truescore_gm_pcm,
    sela_sa_std_15 = sela_truescore_sa_pcm,
    sela_se_std_15 = sela_truescore_se_pcm,
    sela_sm_std_15 = sela_truescore_sm_pcm
  ) %>% drop_na()

tmp_16 <- d %>%
  filter(school_year == 16) %>%
  transmute(
    student_id = student_id,
    sela_gm_std_16 = sela_truescore_gm_pcm,
    sela_sa_std_16 = sela_truescore_sa_pcm,
    sela_se_std_16 = sela_truescore_se_pcm,
    sela_sm_std_16 = sela_truescore_sm_pcm
  ) %>% drop_na()

tmp_17 <- d %>%
  filter(school_year == 17) %>%
  transmute(
    student_id = student_id,
    sela_gm_std_17 = sela_truescore_gm_pcm,
    sela_sa_std_17 = sela_truescore_sa_pcm,
    sela_se_std_17 = sela_truescore_se_pcm,
    sela_sm_std_17 = sela_truescore_sm_pcm
  ) %>% drop_na()

tmp_1 <- inner_join(tmp_15, tmp_16, by="student_id") 
tmp_2 <- inner_join(tmp_16, tmp_17, by="student_id")

colnames(tmp_1) <- colnames(tmp_2) <- c("student_id", 
                                        "GM_t-1", "SA_t-1", "SE_t-1", "SM_t-1",
                                        "GM_t", "SA_t", "SE_t", "SM_t")
tmp <- bind_rows(tmp_1, tmp_2)

stargazer(cor(tmp[,-1]), title="Year to Year Correlations (n=163,071)",
          out=cor_mat_tab_1, type="text", digits=2)

tmp <- inner_join(tmp_15, tmp_16, by="student_id") %>%
  inner_join(tmp_17, by="student_id")

colnames(tmp) <- c("student_id", 
                                        "GM_15", "SA_15", "SE_15", "SM_15",
                                        "GM_16", "SA_16", "SE_16", "SM_16",
                                        "GM_17", "SA_17", "SE_17", "SM_17")

stargazer(cor(tmp[,-1]), title="Three Year Correlations (n=28,678)",
          out=cor_mat_tab_2, type="text", digits=2)


