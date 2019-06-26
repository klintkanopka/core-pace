library(haven)
library(plm)
library(tidyverse)
conflict_prefer("filter", "dplyr", "stats")
conflict_prefer("lag", "dplyr")

source("file_paths.R")

# enrollment data
enrl <- read_dta(file_enrl) %>%
  mutate_at("cds", as.character) %>% 
  select(student_id, school_year, enrl_grade)

# sel surveys
sela_scales <- read_dta(file_sela_scales) %>%
  mutate_at("cds", as.character)

# test data
tests <- read_dta(file_tests) %>%
  mutate_at("cds", as.character) %>%
  mutate_at("tests_exemption", as.factor) 

merge_cond <- c("student_id", "cds", "district", "school_year")

student_sel_d <- sela_scales %>%
  select(student_id, cds, district, school_year, 
         sela_scalescore_gm_pcm, sela_scalescore_sa_pcm, 
         sela_scalescore_se_pcm, sela_scalescore_sm_pcm,
         sela_truescore_gm_pcm, sela_truescore_sa_pcm, 
         sela_truescore_se_pcm, sela_truescore_sm_pcm) %>%
  left_join(enrl, by=c("student_id", "school_year")) %>%
  filter(school_year %in% c(15, 16, 17)) %>%
  filter(enrl_grade %in% c(4, 5, 6, 7)) %>%
  group_by(school_year, enrl_grade) %>%
  mutate(sela_gm_std = scale(sela_scalescore_gm_pcm), 
         sela_sa_std = scale(sela_scalescore_sa_pcm),
         sela_se_std = scale(sela_scalescore_se_pcm), 
         sela_sm_std = scale(sela_scalescore_sm_pcm)) %>%
  ungroup() %>%
  group_by(student_id, school_year) %>% 
  filter(n() == 1) %>%
  ungroup()

# change to number of distinct schools?

sbac_ela <- tests %>%
  select(student_id, cds, district, school_year, 
         tests_rectype, tests_scalescore, tests_level) %>%
  filter(tests_rectype == 1) %>%
  transmute(student_id = student_id,
            cds = cds,
            district= district,
            school_year = school_year,
            sbac_ela = tests_scalescore)

sbac_math <- tests %>%
  select(student_id, cds, district, school_year, 
         tests_rectype, tests_scalescore, tests_level) %>%
  filter(tests_rectype == 2) %>%
  transmute(student_id = student_id,
            cds = cds,
            district= district,
            school_year = school_year,
            sbac_math = tests_scalescore)

d <- student_sel_d %>%
  inner_join(sbac_ela, by=merge_cond) %>%
  inner_join(sbac_math, by=merge_cond) %>%
  group_by(school_year, enrl_grade) %>%
  mutate(sbac_math = scale(sbac_math),
         sbac_ela = scale(sbac_ela)) %>%
  ungroup()  %>%
  select(student_id, school_year, enrl_grade, sbac_ela, sbac_math,
         sela_gm_std, sela_sa_std, sela_se_std, sela_sm_std)

d <- d %>%
  group_by(student_id) %>%
  mutate(d_sbac_ela = sbac_ela - lag(sbac_ela, order_by = school_year),
         d_sbac_math = sbac_math - lag(sbac_math, order_by = school_year),
         d_sela_gm = sela_gm_std - lag(sela_gm_std, order_by = school_year),
         d_sela_sa = sela_sa_std - lag(sela_sa_std, order_by = school_year),
         d_sela_se = sela_se_std - lag(sela_se_std, order_by = school_year),
         d_sela_sm = sela_sm_std - lag(sela_sm_std, order_by = school_year),
         d2_sbac_ela = lag(d_sbac_ela, order_by = school_year),
         d2_sbac_math = lag(d_sbac_math, order_by = school_year),
         d2_sela_gm = lag(d_sela_gm, order_by = school_year),
         d2_sela_sa = lag(d_sela_sa, order_by = school_year),
         d2_sela_se = lag(d_sela_se, order_by = school_year),
         d2_sela_sm = lag(d_sela_sm, order_by = school_year)) %>%
  select(student_id, school_year, enrl_grade,
         d_sbac_ela, d_sbac_math, d_sela_gm, d_sela_sa, d_sela_se, d_sela_sm,
         d2_sbac_ela, d2_sbac_math, d2_sela_gm, d2_sela_sa, d2_sela_se, d2_sela_sm) %>%
  filter(!is.na(d_sela_gm)) %>%
  distinct(student_id, school_year, .keep_all = TRUE) %>%
  ungroup()
  
d_plm <- pdata.frame(d, index=c("student_id", "school_year"), 
                     drop.index = TRUE, row.names=TRUE)

# correlations
source("change_cor.R")

# ela
source("change_ela.R")

# math
source("change_math.R")

# instrumented models
source("instrumented_ela.R")
source("instrumented_math.R")
