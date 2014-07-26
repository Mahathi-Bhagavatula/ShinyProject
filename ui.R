library("shiny")
shinyUI(pageWithSidebar(
  headerPanel("Personal Weight Management Website"),
  sidebarPanel(
    h1('Give Your Details ::'),
    textInput('name', 'Name:', value = ""),
    radioButtons("sex","SEX", c("MALE"="MALE","FEMALE"="FEMALE"),"MALE"),
    numericInput('age', 'Age',0, min=0,max=100,step=1),
    numericInput('height', 'Height (in cm)',1, min=1,max=200,step=1),
    numericInput('weight', 'Weight (in kg)',1, min=1,max=1000,step=1),
    radioButtons("weigthRadio","Loose/ Gain Weight", c("LOOSE"="LOOSE","GAIN"="GAIN"),"LOOSE"),
    numericInput('wtLooseGain', 'Want to Loose/ Gain Weight (in kg)',0, min=0,max=1000,step=1),
    numericInput('days', 'Number of Days',1, min=1,max=10000,step=1),
    checkboxGroupInput ('activity', 'Kind of Excersice',
                        c("Sedentary (little or no exercise)"="no",
                        "Lightly Active (light exercise, doing sports 1-3 days per week)"="little",
                        "Moderately Active (sports/exercise 3-5 days per week)"="moderate",
                        "Very Active (intense sports 6 or 7 days per week)"="very",
                        "Extra Active (sports and exercise, physical job or hard training)"="extra")
                        ),
    submitButton('Submit')
    ),
  mainPanel(
    h3('Here is your weight management Report:'),
    verbatimTextOutput("outName"),
    h4("BMI (Body Mass Index) : "),
    verbatimTextOutput("bmi"),
    h4("Maximum Heart Rate : "),
    verbatimTextOutput("mhr"),
    h4("Calories need to be consumed per day (in kcal):: "),
    verbatimTextOutput("consume"),
    h4("Calories need to be spent per day (in kcal):: "),
    verbatimTextOutput("spend"),
    h3('Documentation'),
    p('Hi User,'),
    p('Personal weight management : As the name suggests, this application mainly
      deals with weight management, in a way some critical statistics about
      gaining/ loosing of weight.'),
    p('The application is used to get the statistics such as the BMI (Body Mass Index) 
      based on your height and weight. It also gives some status whether you are in 
      lower range, normal range, at risk, moderately obese or severely obese. 
      There are other statistics such as Maximum Heart Rate: The maximum heart rate 
      which can be withstand by your heart during your workouts.
      This is calculated based on your age and gender. Finally, This application will get
      you play around the weight statistics, as in case you want to loose or gain 
      your weight, in a specific number of days, doing a specific kind of physical activity,
      This application will assist you with number of calories you need to spend and 
      consume a day to reach your target.This calories depends on all the factors of 
      #kg you want to loose, #days, type of excersice and will change dynamically with 
      these parameters.
      '),
    p('Now, lets Try :)'),
    p('Please provide your details like : Name, Gender, Height, Weight, 
      whether you want to loose or gain, #kg you want to loose/gain, in #days, 
      doing which type of physical activity and Now submit'),
    p('Just check out with your BMI, Maximum Heart Rate, Number of calories you need 
      to consume and spend to acheive the goal.'),
    p('Now, if you like this give me a +1 :) :) :P')
    )))