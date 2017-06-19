# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

individualReliability <- function(data, subscales, n.iter=100) {
  boot_mat <- matrix(nrow = nrow(data), ncol = n.iter) # create matrix for bootstrapping results
  for (i in 1:n.iter) {
    res_indiv_reliability <- c()
    for (row in 1:nrow(data)) {
      df_person <- data[row,]
      vector1 <- c()
      vector2 <- c()
      for (scale in subscales) {
        df_tmp <- df_person[,grep(scale, names(df_person), value = TRUE)]
        half1 <- sample(names(df_tmp),ncol(df_tmp)/2)
        half2 <- !(names(df_tmp) %in% sample(names(df_tmp),ncol(df_tmp)/2))
        h1_i <- df_tmp[,half1]
        h2_i <- df_tmp[,half2]
        vector1 <- c(vector1, rowMeans(h1_i))
        vector2 <- c(vector2, rowMeans(h2_i))
      }
      res_indiv_reliability <- c(res_indiv_reliability, cor(vector1, vector2))
    }
    boot_mat[,i] <- res_indiv_reliability
  }
  print()
  return(boot_mat);
  print(boot_mat);
}
