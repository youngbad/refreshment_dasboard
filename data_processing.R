sales$cost <- sales$sales * (sample(75:95, size = nrow(sales), replace = TRUE)/100)
saveRDS(sales, "sales.rds")

