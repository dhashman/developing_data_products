# ui.R

shinyUI(fluidPage(
    titlePanel("How much longer am I likely to live?"),
    
    fluidRow(
        column(12,
            h4("This application calculates your residual 
                life expectancy (RLE) based on statistics from 
                the ", a("Global Health Observatory (GHO) data 
                repository.", 
                href = "http://www.who.int/gho/database/en/")),  
            h4("With this application, you also have the option to
                customize the answer based on your personal lifestyle 
                risk factors as identifed by a recent ", a("cohort study.", 
                href = "http://www.biomedcentral.com/1741-7015/12/59")), 
            h4("To run the application, answer the following questions  
                below then press 'Enter'. If you choose 'Yes' to get a 
                customized response, you will be presented with additional 
                questions to answer before pressing 'Enter'."), 
            h4("If the screen appears greyed out, refresh the page 
               to wake up the application."), 
            br()
        )
    ),
    
    fluidRow(
        column(6,
            selectInput("region", 
                label = "In what region do you live?",
                choices = c("Africa", "Eastern Mediterranean", "Europe", 
                    "Americas", "South-East Asia", "Western Pacific"), 
                    selected = "Americas"),
            
            selectInput("sex", 
                label = "What is your sex?",
                choices = c("Female", "Male"), 
                selected = "Male"),
            
            numericInput("age", 
                label = "What is your age in years?",
                value = 30),

            selectInput("customize", 
                label = "Would you like a customized response based on your personal lifestyle risk factors?",
                choices = c("No", "Yes"),
                selected = "No")     
        ),
        
        column(6,
            conditionalPanel(
                condition = "input.customize == 'Yes'",
             
                selectInput("smoking", 
                    label = "What is your smoking preference?",
                    choices = c("Has never smoked", 
                        "Quit smoking more than 10 years ago", 
                        "Quit smoking within the last 10 years", 
                        "Smokes 10 or fewer cigarettes/day", 
                        "Smokes more than 10 cigarettes/day")),
            
                numericInput("height", 
                    label = "What is your height in inches?",
                    value = 64),
            
                numericInput("weight", 
                    label = "What is your weight in pounds?",
                    value = 137),
                
                numericInput("alcohol", 
                    label = "On average, how many alcoholic drinks do you have per day?",
                    value = 2),
                
                selectInput("meat", 
                            label = "On average, how much processed/red meat do you eat per day?",
                            choices = c("Less than 4 ounces (120 grams)", 
                                        "4 ounces (120 grams) or more"))
            )
        )
    ),

    fluidRow(
        column(12,
            br(),
            br(),
            actionButton("goButton", "Enter")
        )
    ),
    
    fluidRow(
        column(12,
            br(),
            br(),
            conditionalPanel(
                condition = "input.customize == 'No'",
                textOutput("text1")
            ),
            conditionalPanel(
                condition = "input.customize == 'Yes'",
                textOutput("text2")
            ),
            br(),
            conditionalPanel(
                condition = "input.customize == 'Yes'",
                textOutput("text3")
            )
                
        )
    )
))