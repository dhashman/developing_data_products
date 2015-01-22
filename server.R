# server.R

library(shiny)
source("helpers.R")

ev_df <- readRDS("data/ev.rds")

shinyServer(
    function(input, output) {
        output$text1 <- renderText({
            if (input$goButton == 0)
                return()
            isolate(
                paste("As an average ", tolower(input$sex), 
                    " who is ", input$age,
                    " years old living in the ", input$region, 
                    " region, you can expect to live approximately ", 
                    ev_df[ev_df$WHO.region == input$region 
                        & ev_df$Sex == input$sex 
                        & ev_df$Age.Group == get_ageRange(input$age), ]$Numeric, 
                    " more years. ",   
                    sep = "")
            )
        })
        output$text2 <- renderText({
            if (input$goButton == 0) 
                return()
            isolate(
                paste("As a ", tolower(input$sex), 
                    " who is ", input$age,
                    " years old living in the ", input$region, 
                    " region, who ", tolower(input$smoking),
                    " and has a body mass index (BMI) of ", 
                    get_bmi(input$height, input$weight), 
                    " and who has, on average, ", tolower(input$alcohol), 
                    " alcoholic drinks per day and eats ", tolower(input$meat), 
                    " of processed/red meat per day,", 
                    " you can expect to live approximately ", 
                    round(ev_df[ev_df$WHO.region == input$region 
                        & ev_df$Sex == input$sex 
                        & ev_df$Age.Group == get_ageRange(input$age), ]$Numeric
                        * get_sexAdj(input$sex) 
                        - get_smokingAdj(input$sex, input$smoking) 
                        - get_bmiAdj(input$sex, get_bmi(input$height, input$weight)) 
                        - get_alcoholAdj(input$sex, input$alcohol) 
                        - get_meatAdj(input$sex, input$meat), 0), 
                     " more years. ",   
                     sep = "")
            )
        
        })
        output$text3 <- renderText({
            if (input$goButton == 0) 
                return()
            isolate(
                paste("Studies have shown that people with the lowest ",
                    "personal lifestye risk factors can live up to 17 years ",
                    "longer than those with the highest risk factors. ", 
                    "Try adjusting your risk factors and then hit 'Enter' to ", 
                    "see the possible effect of lifestyle changes.",
                      sep = "")
            )
            
        })
    }
)