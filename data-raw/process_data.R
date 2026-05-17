# Process data from 2016
library(readxl)
library(tidyverse)
df2016 <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/SDOH_2016_ZIPCODE_1_0.xlsx",
                     sheet = "Data")
df2016_labels <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/SDOH_2016_ZIPCODE_1_0.xlsx")


df2016 <- df2016 %>% dplyr::select(YEAR, ZIPCODE, 
                                   ACS_PCT_FOREIGN_BORN_ZC,
                                   ACS_PCT_BLACK_ZC,
                                   ACS_PCT_ASIAN_ZC,
                                   ACS_PCT_WHITE_ZC,
                                   ACS_PCT_HISPANIC_ZC,
                                   ACS_PCT_ENGLISH_ZC,
                                   ACS_PCT_OWNER_HU_ZC,
                                   ACS_PCT_IN_COUNTY_MOVE_ZC,
                                   ACS_TOT_HU_ZC,
                                   ACS_MEDIAN_RENT_ZC,
                                   ACS_PCT_COMMT_15MIN_ZC,
                                   ACS_PCT_COMMT_29MIN_ZC,
                                   POS_DIST_ED_ZP,
                                   ACS_PCT_MEDICAID_ANY_ZC,
                                   CCBP_TOT_PHYS_ZP,
                                   CCBP_TOT_CFS_ZP,
                                   ACS_MEDIAN_HH_INC_ZC,
                                   ACS_PCT_LT_HS_ZC,
                                   ACS_PCT_BACHELOR_DGR_ZC,
                                   ACS_PCT_HEALTH_INC_BELOW137_ZC,
                                   ACS_PCT_UNEMPLOY_ZC,
                                   ACS_GINI_INDEX_ZC,
                                   ACS_PCT_HH_PUB_ASSIST_ZC
) # Missing No. hospital beds per 1,000, % without internet access

# 2017 data ---------------------------------------------------------------

df2017 <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/SDOH_2016_ZIPCODE_1_0.xlsx",
                     sheet = "Data")
df2017_labels <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/SDOH_2017_ZIPCODE_1_0.xlsx")

df2017 <- df2017 %>% dplyr::select(YEAR, ZIPCODE, 
                                   ACS_PCT_FOREIGN_BORN_ZC,
                                   ACS_PCT_BLACK_ZC,
                                   ACS_PCT_ASIAN_ZC,
                                   ACS_PCT_WHITE_ZC,
                                   ACS_PCT_HISPANIC_ZC,
                                   ACS_PCT_ENGLISH_ZC,
                                   ACS_PCT_OWNER_HU_ZC,
                                   ACS_PCT_IN_COUNTY_MOVE_ZC,
                                   ACS_TOT_HU_ZC,
                                   ACS_MEDIAN_RENT_ZC,
                                   ACS_PCT_COMMT_15MIN_ZC,
                                   ACS_PCT_COMMT_29MIN_ZC,
                                   POS_DIST_ED_ZP,
                                   ACS_PCT_MEDICAID_ANY_ZC,
                                   CCBP_TOT_PHYS_ZP,
                                   CCBP_TOT_CFS_ZP,
                                   ACS_MEDIAN_HH_INC_ZC,
                                   ACS_PCT_LT_HS_ZC,
                                   ACS_PCT_BACHELOR_DGR_ZC,
                                   ACS_PCT_HEALTH_INC_BELOW137_ZC,
                                   ACS_PCT_UNEMPLOY_ZC,
                                   ACS_GINI_INDEX_ZC,
                                   ACS_PCT_HH_PUB_ASSIST_ZC,
                                   ACS_PCT_HH_NO_INTERNET_ZC
) # Missing No. hospital beds per 1,000

# 2018 data ---------------------------------------------------------------

df2018 <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/SDOH_2018_ZIPCODE_1_0.xlsx",
                     sheet = "Data")
df2018_labels <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/SDOH_2018_ZIPCODE_1_0.xlsx")

df2018 <- df2018 %>% dplyr::select(YEAR, ZIPCODE, 
                                   ACS_PCT_FOREIGN_BORN_ZC,
                                   ACS_PCT_BLACK_ZC,
                                   ACS_PCT_ASIAN_ZC,
                                   ACS_PCT_WHITE_ZC,
                                   ACS_PCT_HISPANIC_ZC,
                                   ACS_PCT_ENGLISH_ZC,
                                   ACS_PCT_OWNER_HU_ZC,
                                   ACS_PCT_IN_COUNTY_MOVE_ZC,
                                   ACS_TOT_HU_ZC,
                                   ACS_MEDIAN_RENT_ZC,
                                   ACS_PCT_COMMT_15MIN_ZC,
                                   ACS_PCT_COMMT_29MIN_ZC,
                                   POS_DIST_ED_ZP,
                                   ACS_PCT_MEDICAID_ANY_ZC,
                                   CCBP_TOT_PHYS_ZP,
                                   CCBP_TOT_CFS_ZP,
                                   ACS_MEDIAN_HH_INC_ZC,
                                   ACS_PCT_LT_HS_ZC,
                                   ACS_PCT_BACHELOR_DGR_ZC,
                                   ACS_PCT_HEALTH_INC_BELOW137_ZC,
                                   ACS_PCT_UNEMPLOY_ZC,
                                   ACS_GINI_INDEX_ZC,
                                   ACS_PCT_HH_PUB_ASSIST_ZC,
                                   ACS_PCT_HH_NO_INTERNET_ZC
) # Missing No. hospital beds per 1,000

# 2019 data ---------------------------------------------------------------

df2019 <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/SDOH_2019_ZIPCODE_1_0.xlsx",
                     sheet = "Data")
df2019_labels <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/SDOH_2019_ZIPCODE_1_0.xlsx")

df2019 <- df2019 %>% dplyr::select(YEAR, ZIPCODE, 
                                   ACS_PCT_FOREIGN_BORN_ZC,
                                   ACS_PCT_BLACK_ZC,
                                   ACS_PCT_ASIAN_ZC,
                                   ACS_PCT_WHITE_ZC,
                                   ACS_PCT_HISPANIC_ZC,
                                   ACS_PCT_ENGLISH_ZC,
                                   ACS_PCT_OWNER_HU_ZC,
                                   ACS_PCT_IN_COUNTY_MOVE_ZC,
                                   ACS_TOT_HU_ZC,
                                   ACS_MEDIAN_RENT_ZC,
                                   ACS_PCT_COMMT_15MIN_ZC,
                                   ACS_PCT_COMMT_29MIN_ZC,
                                   POS_DIST_ED_ZP,
                                   ACS_PCT_MEDICAID_ANY_ZC,
                                   CCBP_TOT_PHYS_ZP,
                                   CCBP_TOT_CFS_ZP,
                                   ACS_MEDIAN_HH_INC_ZC,
                                   ACS_PCT_LT_HS_ZC,
                                   ACS_PCT_BACHELOR_DGR_ZC,
                                   ACS_PCT_HEALTH_INC_BELOW137_ZC,
                                   ACS_PCT_UNEMPLOY_ZC,
                                   ACS_GINI_INDEX_ZC,
                                   ACS_PCT_HH_PUB_ASSIST_ZC,
                                   ACS_PCT_HH_NO_INTERNET_ZC
) # Missing No. hospital beds per 1,000

# 2020 data ---------------------------------------------------------------

df2020 <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/SDOH_2020_ZIPCODE_1_0.xlsx",
                     sheet = "Data")
df2020_labels <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/SDOH_2020_ZIPCODE_1_0.xlsx")

df2020 <- df2020 %>% dplyr::select(YEAR, ZIPCODE, 
                                   ACS_PCT_FOREIGN_BORN_ZC,
                                   ACS_PCT_BLACK_ZC,
                                   ACS_PCT_ASIAN_ZC,
                                   ACS_PCT_WHITE_ZC,
                                   ACS_PCT_HISPANIC_ZC,
                                   ACS_PCT_ENGLISH_ZC,
                                   ACS_PCT_OWNER_HU_ZC,
                                   ACS_PCT_IN_COUNTY_MOVE_ZC,
                                   ACS_TOT_HU_ZC,
                                   ACS_MEDIAN_RENT_ZC,
                                   ACS_PCT_COMMT_15MIN_ZC,
                                   ACS_PCT_COMMT_29MIN_ZC,
                                   POS_DIST_ED_ZP,
                                   ACS_PCT_MEDICAID_ANY_ZC,
                                   #CCBP_TOT_PHYS_ZP,
                                   #CCBP_TOT_CFS_ZP,
                                   ACS_MEDIAN_HH_INC_ZC,
                                   ACS_PCT_LT_HS_ZC,
                                   ACS_PCT_BACHELOR_DGR_ZC,
                                   ACS_PCT_HEALTH_INC_BELOW137_ZC,
                                   ACS_PCT_UNEMPLOY_ZC,
                                   ACS_GINI_INDEX_ZC,
                                   ACS_PCT_HH_PUB_ASSIST_ZC,
                                   ACS_PCT_HH_NO_INTERNET_ZC
) # Missing No. hospital beds per 1,000

# 2021 data ---------------------------------------------------------------

df2021 <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/CLH_2021_ZIPCODE_2_0.xlsx",
                     sheet = "Data")
df2021_labels <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/CLH_2021_ZIPCODE_2_0.xlsx")

df2021 <- df2021 %>% dplyr::select(YEAR, ZIPCODE, 
                                   ACS_PCT_FOREIGN_BORN_ZC,
                                   ACS_PCT_BLACK_ZC,
                                   ACS_PCT_ASIAN_ZC,
                                   ACS_PCT_WHITE_ZC,
                                   ACS_PCT_HISPANIC_ZC,
                                   ACS_PCT_ENGLISH_ZC,
                                   ACS_PCT_OWNER_HU_ZC,
                                   ACS_PCT_IN_COUNTY_MOVE_ZC,
                                   ACS_TOT_HU_ZC,
                                   ACS_MEDIAN_RENT_ZC,
                                   ACS_PCT_COMMT_15MIN_ZC,
                                   ACS_PCT_COMMT_29MIN_ZC,
                                   POS_DIST_ED_ZP,
                                   ACS_PCT_MEDICAID_ANY_ZC,
                                   CCBP_TOT_PHYS_ZP,
                                   CCBP_TOT_CFS_ZP,
                                   ACS_MEDIAN_HH_INC_ZC,
                                   ACS_PCT_LT_HS_ZC,
                                   ACS_PCT_BACHELOR_DGR_ZC,
                                   ACS_PCT_HEALTH_INC_BELOW137_ZC,
                                   ACS_PCT_UNEMPLOY_ZC,
                                   ACS_GINI_INDEX_ZC,
                                   ACS_PCT_HH_PUB_ASSIST_ZC,
                                   ACS_PCT_HH_NO_INTERNET_ZC
) # Missing No. hospital beds per 1,000

# 2022 data ---------------------------------------------------------------

df2022 <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/CLH_2022_ZIPCODE_2_0.xlsx",
                     sheet = "Data")
df2022_labels <- read_excel("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/CLH_2022_ZIPCODE_2_0.xlsx")

df2022 <- df2022 %>% dplyr::select(YEAR, ZIPCODE, 
                                   ACS_PCT_FOREIGN_BORN_ZC,
                                   ACS_PCT_BLACK_ZC,
                                   ACS_PCT_ASIAN_ZC,
                                   ACS_PCT_WHITE_ZC,
                                   ACS_PCT_HISPANIC_ZC,
                                   ACS_PCT_ENGLISH_ZC,
                                   ACS_PCT_OWNER_HU_ZC,
                                   ACS_PCT_IN_COUNTY_MOVE_ZC,
                                   ACS_TOT_HU_ZC,
                                   ACS_MEDIAN_RENT_ZC,
                                   ACS_PCT_COMMT_15MIN_ZC,
                                   ACS_PCT_COMMT_29MIN_ZC,
                                   POS_DIST_ED_ZP,
                                   ACS_PCT_MEDICAID_ANY_ZC,
                                   CCBP_TOT_PHYS_ZP,
                                   CCBP_TOT_CFS_ZP,
                                   ACS_MEDIAN_HH_INC_ZC,
                                   ACS_PCT_LT_HS_ZC,
                                   ACS_PCT_BACHELOR_DGR_ZC,
                                   ACS_PCT_HEALTH_INC_BELOW137_ZC,
                                   ACS_PCT_UNEMPLOY_ZC,
                                   ACS_GINI_INDEX_ZC,
                                   ACS_PCT_HH_PUB_ASSIST_ZC,
                                   ACS_PCT_HH_NO_INTERNET_ZC
) # Missing No. hospital beds per 1,000


# Impute missing Internet for 2016 data -----------------------------------

# Imputed values are carried backwards from 2017 by ZIPCODE
df2016 <- left_join(df2016, 
                    df2017 %>% 
                      dplyr::select(ZIPCODE, ACS_PCT_HH_NO_INTERNET_ZC))


# Impute missing CCBP for 2020 data ---------------------------------------

# Imputed values are carried backwards from 2021 by ZIPCODE
df2020 <- left_join(df2020,
                    df2021 %>%
                      dplyr::select(ZIPCODE, CCBP_TOT_PHYS_ZP, CCBP_TOT_CFS_ZP))

# Create stacked final data -----------------------------------------------

dfahrq <- bind_rows(df2016,
                    df2017,
                    df2018,
                    df2019,
                    df2020,
                    df2021,
                    df2022)

# Processing election data ------------------------------------------------

library(data.table)
pres_elect <- fread(
  "R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/election_data/countypres_2000-2024.tab",
  sep = "\t",
  header = TRUE,
  quote = "",           # Disable quoting
  fill = TRUE,          # Fill incomplete rows
  na.strings = c("", "NA")
)
# Convert to data.frame
pres_elect <- as.data.frame(pres_elect)

# Filter to only 2016 and 2020, keep only relevant variable
pres_elect <- pres_elect %>% filter(year %in% c(2016, 2020)) %>%
  filter(mode == "TOTAL") %>%
  dplyr::select(year, county_fips, totalvotes) %>%
  distinct()

pres_elect_20 <- pres_elect %>% filter(year==2020)
pres_elect_16 <- pres_elect %>% filter(year==2016)

# Merge in ZIP codes
fips_zip_cross <- read.csv("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/ZIP-COUNTY-FIPS_2017-06.csv",
                           header=T,
                           colClasses = c("ZIP" = "character",
                                          "COUNTYNAME" = "character",
                                          "STATE" = "character",
                                          "STCOUNTYFP" = "integer",
                                          "CLASSFP" = "character"))

pres_elect_20 <- left_join(fips_zip_cross %>% dplyr::select(ZIP, STCOUNTYFP)
                           %>% rename(county_fips = "STCOUNTYFP"),
                           pres_elect_20) %>%
  dplyr::select(-c(county_fips)) %>%
  distinct() %>%
  filter(!is.na(totalvotes)) %>%
  # There are multiple totalvotes recorded per ZIP, take average
  group_by(ZIP, year) %>%
  mutate(totalvotes = mean(totalvotes)) %>%
  ungroup() %>%
  distinct()

pres_elect_16 <- left_join(fips_zip_cross %>% dplyr::select(ZIP, STCOUNTYFP)
                           %>% rename(county_fips = "STCOUNTYFP"),
                           pres_elect_16) %>%
  dplyr::select(-c(county_fips)) %>%
  distinct() %>%
  filter(!is.na(totalvotes)) %>%
  # There are multiple totalvotes recorded per ZIP, take average
  group_by(ZIP, year) %>%
  mutate(totalvotes = mean(totalvotes)) %>%
  ungroup() %>%
  distinct()

pres_elect <- bind_rows(pres_elect_16,
                        pres_elect_16 %>% mutate(year = 2017),
                        pres_elect_16 %>% mutate(year = 2018),
                        pres_elect_16 %>% mutate(year = 2019),
                        pres_elect_20,
                        pres_elect_20 %>% mutate(year = 2021),
                        pres_elect_20 %>% mutate(year = 2022)) %>%
  rename(YEAR = "year") %>%
  rename(ZIPCODE = "ZIP") %>%
  rename(TOTALPRESVOTES = "totalvotes")


# Add Presidential Election Data to AHRQ ----------------------------------

dfahrq <- dfahrq %>% arrange(ZIPCODE, YEAR)
pres_elect <- pres_elect %>% arrange(ZIPCODE, YEAR)

dfahrq_pres <- left_join(dfahrq, pres_elect)


# Add in Crime Rate -------------------------------------------------------

crime_df <- read.csv("R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/source data/2016 crime by county.csv",
                           header=T)

crime_df <- crime_df %>%
  separate(county_name,
           into = c("COUNTYNAME", "STATE"),
           sep = ",",
           remove = F) %>%
  mutate(
    COUNTYNAME = trimws(COUNTYNAME),
    STATE = trimws(STATE)
  ) %>%
  dplyr::select(COUNTYNAME, STATE, crime_rate_per_100000)

crime_df <- left_join(fips_zip_cross %>% dplyr::select(-c(STCOUNTYFP, CLASSFP)),
                      crime_df) %>%
  rename(ZIPCODE = "ZIP") %>%
  dplyr::select(-c(COUNTYNAME, STATE)) %>%
  # There are multiple crime rates recorded per ZIP, take average
  group_by(ZIPCODE) %>%
  mutate(crime_rate_per_100000 = mean(crime_rate_per_100000)) %>%
  ungroup() %>%
  distinct()

dfahrq_pres_crime <- left_join(dfahrq_pres, crime_df)

save(dfahrq_pres_crime, file='R:/PrevMed/GRP_KHAN/PROJECTS/Jack Huang/GWTG/Place Based SDOH Clusters/merged_sdoh.RData')
