# helpers.R

get_ageRange <- function(age) {
    ifelse(age < 1, "<1",
    ifelse(age < 5, "1-4",
    ifelse(age < 10, "5-9",
    ifelse(age < 15, "10-14",
    ifelse(age < 20, "15-19",
    ifelse(age < 25, "20-24",
    ifelse(age < 30, "25-29",
    ifelse(age < 35, "30-34",
    ifelse(age < 40, "35-39",
    ifelse(age < 45, "40-44",
    ifelse(age < 50, "45-49",
    ifelse(age < 55, "50-54",
    ifelse(age < 60, "55-59",
    ifelse(age < 65, "60-64",
    ifelse(age < 70, "65-69",
    ifelse(age < 75, "70-74",
    ifelse(age < 80, "75-79",
    ifelse(age < 85, "80-84",
    ifelse(age < 90, "85-89",
    ifelse(age < 95, "90-94",
    ifelse(age < 100, "95-99",
    "100+")))))))))))))))))))))
}

get_bmi <- function(height, weight) {
    round((weight / height ^ 2) * 703, 1)
}

get_sexAdj <- function(sex) {
    ifelse(sex =="Male", 1.12, 1.08)
}

get_smokingAdj <- function(sex, smoking) {
    ifelse(sex == "Male" & smoking == "Has never smoked", 0,
    ifelse(sex == "Male" & smoking == "Quit smoking more than 10 years ago", 1.4, 
    ifelse(sex == "Male" & smoking == "Quit smoking within the last 10 years", 4.8, 
    ifelse(sex == "Male" & smoking == "Smokes 10 or fewer cigarettes/day", 5.3, 
    ifelse(sex == "Male" & smoking == "Smokes more than 10 cigarettes/day", 9.4, 
    ifelse(sex == "Female" & smoking == "Has never smoked", 0,
    ifelse(sex == "Female" & smoking == "Quit smoking more than 10 years ago", 0.2, 
    ifelse(sex == "Female" & smoking == "Quit smoking within the last 10 years", 0.9, 
    ifelse(sex == "Female" & smoking == "Smokes 10 or fewer cigarettes/day", 5, 
    7.3)))))))))
}

get_bmiAdj <- function(sex, bmi) {
    ifelse(sex == "Male" & bmi < 22.5, 3.5, 
    ifelse(sex == "Male" & bmi >= 22.5 & bmi <= 24.9, 0,
    ifelse(sex == "Male" & bmi >= 25 & bmi <= 29.9, 1.1,
    ifelse(sex == "Male" & bmi >= 30, 3.1,
    ifelse(sex == "Female" & bmi < 22.5, 2.1, 
    ifelse(sex == "Female" & bmi >= 22.5 & bmi <= 24.9, 0,
    ifelse(sex == "Female" & bmi >= 25 & bmi <= 29.9, 0.6,
    3.2)))))))
}

get_alcoholAdj <- function(sex, alcohol) {
    ifelse(sex == "Male" & alcohol <= 2, 0,
    ifelse(sex == "Male" & alcohol >= 2.1 & alcohol <= 4, 1.7,
    ifelse(sex == "Male" & alcohol > 4, 3.1,
    ifelse(sex == "Female" & alcohol <= 0.5, 0,
    ifelse(sex == "Female" & alcohol >= 0.6 & alcohol <= 1, -1,
    1)))))
}

get_meatAdj <- function(sex, meat) {
    ifelse(sex == "Male" & meat == "Less than 4 ounces (120 grams)", 0,
    ifelse(sex == "Male" & meat == "4 ounces (120 grams) or more", 1.4, 
    ifelse(sex == "Female" & meat == "Less than 4 ounces (120 grams)", 0,
    2.4)))
}