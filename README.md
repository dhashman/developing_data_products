# Coursera Developing Data Products project

For this project, we write a shiny application with associated supporting documentation. 
The application calculates your residual life expectancy (RLE) based on statistics from 
the Global Health Observatory (GHO) data repository, with the option to 
customize the answer based on personal lifestyle risk factors.

Documentation is embedded within the application, telling the user to 
answer certain questions then press 'Enter'. If the user chooses to get a 
customized response, additional questions must be answered before pressing 'Enter'. 
The application was deployed on Rstudio's shiny server, with 
the source code shared in this repository.

The application includes the following:

1. Some form of input (widget: textbox, radio button, checkbox, ...).
2. Some operation on the ui input in sever.R.
3. Some reactive output displayed as a result of server calculations.
