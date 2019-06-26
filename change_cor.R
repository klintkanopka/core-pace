library(stargazer)

names <- c("$\\Delta SBAC_{ELA}",
           "$\\Delta SBAC_{math}",
           "$\\Delta SEL_{GM}",
           "$\\Delta SEL_{SA}",
           "$\\Delta SEL_{SE}",
           "$\\Delta SEL_{SM}",
           "$\\Delta SBAC_{ELA,t-1}",
           "$\\Delta SBAC_{math,t-1}",
           "$\\Delta SEL_{GM,t-1}",
           "$\\Delta SEL_{SA,t-1}",
           "$\\Delta SEL_{SE,t-1}",
           "$\\Delta SEL_{SM,t-1}")
cor_mat <- cor(d_plm[,-1], use="pairwise.complete.obs")
rownames(cor_mat) <- colnames(cor_mat) <- names

stargazer(cor_mat[1:6,1:6], out=change_cor_tab_1, 
          title="Correlations between score changes",
          summary=FALSE, type="text", digits=2)

stargazer(cor_mat[1:6,7:12], out=change_cor_tab_2, 
          title="Correlations between score changes and lagged score changes",
          summary=FALSE, type="text", digits=2)