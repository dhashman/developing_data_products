library(dplyr)
regions = c("AFR", "EMR", "EUR", "AMR", "SEAR", "WPR")
prefix <- "http://apps.who.int/gho/athena/data/data-text.csv?target=GHO/"
ev <- "LIFE_0000000035"
suffix <- "&profile=text&filter=COUNTRY:-;YEAR:2012;SEX:FMLE;SEX:MLE;REGION:"
ev_df <- do.call(rbind, lapply(regions, 
    function(region) {
        url <- paste(prefix, ev, suffix, region, sep="") 
        data <- distinct(select(read.csv(url), WHO.region, Sex, Age.Group, Numeric))
        return(data)
        }
    )
)
ages <- c("<1", "1-4", "5-9", "10-14", "15-19", "20-24", "25-29", "30-34", 
    "35-39", "40-44", "45-49", "50-54", "55-59", "60-64", "65-69", "70-74", 
    "75-79", "80-84", "85-89", "90-94", "95-99", "100+")
ev_df$Age.Group <- factor(ev_df$Age.Group, levels=ages)
ev_df <- arrange(ev_df, WHO.region, Sex, Age.Group)
saveRDS(ev_df, file = "./ddp_project/data/ev.rds")