library(haven)
library(tidyverse)
conflict_prefer("filter", "dplyr", "stats")

# culture-climate surveys
escc <- read_dta(file_escc) %>%
  mutate_at("cds", as.character)
hscc <- read_dta(file_hscc) %>%
  mutate_at("cds", as.character)
fcc  <- read_dta(file_fcc) %>%
  mutate_at("cds", as.character)
scc  <- read_dta(file_scc) %>%
  mutate_at("cds", as.character)

# school quality improvement index
sqii <- read_dta(file_sqii) %>%
  mutate_at("cds", as.character)

# school-level data
sch  <- read_dta(file_sch) %>%
  mutate_at("cds", as.character)
scha <- read_dta(file_scha) %>%
  mutate_at("cds", as.character)

# attendance data
att  <- read_dta(file_att) %>%
  select(student_id, cds, district, school_year, 
         att_daysenr, att_daysabs, att_daysatt) %>%
  mutate_at("cds", as.character)

# enrollment data
enrl <- read_dta(file_enrl) %>%
  mutate_at("cds", as.character)

# sel surveys
sela <- read_dta(file_sela) %>%
  mutate_at("cds", as.character)
selb <- read_dta(file_selb) %>%
  mutate_at("cds", as.character)

sela_scales <- read_dta(file_sela_scales) %>%
  mutate_at("cds", as.character)

# student data
stu  <- read_dta(file_stu)
stua <- read_dta(file_stua) %>%
  mutate_at("cds", as.character)

# test data
tests <- read_dta(file_tests) %>%
  mutate_at("cds", as.character) %>%
  mutate_at("tests_exemption", as.factor) 

merge_cond <- c("student_id", "cds", "district", "school_year")
#inner_join(tests, sela, by=merge_cond) %>%

student_sel_d <- sela_scales %>%
  select(student_id, cds, district, school_year, 
         sela_scalescore_gm_pcm, sela_scalescore_sa_pcm, 
         sela_scalescore_se_pcm, sela_scalescore_sm_pcm) %>%
  inner_join(stua, by=merge_cond) %>%
  left_join(stu, by="student_id") %>%
  left_join(sch, by=c("cds", "district")) %>%
  left_join(scha, by=c("cds", "district", "school_year")) %>%
  inner_join(att, by=merge_cond) %>%
  filter(school_year %in% c(15, 16, 17)) %>%
  group_by(student_id, school_year) %>% 
  filter(n() == 1) %>% 
  ungroup() %>%
  group_by(student_id) %>% 
  filter(n_distinct(school_year) == 3) %>% 
  ungroup()