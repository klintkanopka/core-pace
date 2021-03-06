library(fs)

dir_data <- "/media/core-pace/20190211"
dir_output <- here::here("output")

file_escc <- path(dir_data, "escc_20190211", ext="dta")
file_hscc <- path(dir_data, "hscc_20190211", ext="dta") 
file_fcc  <- path(dir_data, "fcc_20190211", ext="dta") 
file_scc  <- path(dir_data, "scc_20190211", ext="dta") 
file_sqii <- path(dir_data, "sqii_20190211", ext="dta")
file_sch  <- path(dir_data, "sch_20190211", ext="dta")
file_scha <- path(dir_data, "scha_20190211", ext="dta")
file_att  <- path(dir_data, "att_20190211", ext="dta")
file_enrl <- path(dir_data, "enrl_20190211", ext="dta")
file_sela <- path(dir_data, "sela_20190211", ext="dta")
file_sela_scales <- path(dir_data, "sela_scales_20190211", ext="dta")
file_selb <- path(dir_data, "selb_20190211", ext="dta")
file_stu  <- path(dir_data, "stu_20190211", ext="dta")
file_stua <- path(dir_data, "stua_20190211", ext="dta")
file_tests <- path(dir_data, "tests_20190211", ext="dta")

math_gm_tab <- path(dir_output, "math_gm", ext="tex")
math_sa_tab <- path(dir_output, "math_sa", ext="tex")
math_se_tab <- path(dir_output, "math_se", ext="tex")
math_sm_tab <- path(dir_output, "math_sm", ext="tex")

ela_gm_tab <- path(dir_output, "ela_gm", ext="tex")
ela_sa_tab <- path(dir_output, "ela_sa", ext="tex")
ela_se_tab <- path(dir_output, "ela_se", ext="tex")
ela_sm_tab <- path(dir_output, "ela_sm", ext="tex")

demo_tab <- path(dir_output, "demo_tab", ext="tex")
means_tab <- path(dir_output, "means_tab", ext="tex")

cor_mat_tab_1 <- path(dir_output, "cor_mat_1", ext="tex")
cor_mat_tab_2 <- path(dir_output, "cor_mat_2", ext="tex")

change_cor_tab_1 <- path(dir_output, "change_cor_1", ext="tex")
change_cor_tab_2 <- path(dir_output, "change_cor_2", ext="tex")

delta_math_gm_tab <- path(dir_output, "delta_math_gm", ext="tex")
delta_math_sa_tab <- path(dir_output, "delta_math_sa", ext="tex")
delta_math_se_tab <- path(dir_output, "delta_math_se", ext="tex")
delta_math_sm_tab <- path(dir_output, "delta_math_sm", ext="tex")

delta_ela_gm_tab <- path(dir_output, "delta_ela_gm", ext="tex")
delta_ela_sa_tab <- path(dir_output, "delta_ela_sa", ext="tex")
delta_ela_se_tab <- path(dir_output, "delta_ela_se", ext="tex")
delta_ela_sm_tab <- path(dir_output, "delta_ela_sm", ext="tex")
