library("shiny")

calucateBMI <- function(height, weight)
{
    (weight/(height*height))*10000
}
getRangeBMI<- function(inputBMI)
{
  if(inputBMI<18.5)
    "Under the normal Range"
  else if(inputBMI>=18.5&inputBMI<=22.9)
    "Normal Range"
  else if(inputBMI>22.9&inputBMI<=24.9)
    "Overweight - At Risk"
  else if(inputBMI>24.9&inputBMI<=29.9)
    "Overweight - Moderately Obese"
  else if(inputBMI>29.9)
    "Overweight - Severely Obese"
}
calucateHeartRate <- function(sex, age)
{
  if(sex=="MALE")
   202-(0.55*age)
  else if(sex=="FEMALE")
    216-(1.09*age)
}

calculateCalorieConsumption<- function(age, height, weight, activity,sex,wtLooseGain,days,weightRadio)
{
  bmr <- calculateBMR(height,weight,sex,age)
  calorie<- calculateCalorie(bmr,activity)
  if(weightRadio=="LOOSE")
  consume <- calorie - caluculateCalorieSpent(wtLooseGain,days)
  if(weightRadio=="GAIN")
    consume <- calorie + caluculateCalorieSpent(wtLooseGain,days)
  consume
}

calculateBMR<- function(height,weight,sex,age)
{
  if(sex=="FEMALE")
    655 + ( 9.6 * weight) + ( 1.8 * height) - ( 4.7 * age )
  else if(sex=="MALE")
    66 + ( 13.7 * weight ) + ( 5 * height) - ( 6.8 * age ) 
}
calculateCalorie <- function(bmr, activity)
{
  if(activity=="no")
    bmr*1.2
  else if(activity=="little")
    bmr*1.375
  else if(activity=="moderate")
    bmr*1.55
  else if(activity=="very")
    bmr*1.725
  else if(activity=="extra")
    bmr*1.9
}
caluculateCalorieSpent<- function(wtLooseGain,days)
{
  (wtLooseGain*7716.17917647)/days
}
shinyServer(
  function(input, output){
    output$outName <- renderPrint({
      if({input$name}==""){""}
      else
      {paste("Hi ", input$name, "!! I hope you have a great day")}})
    output$bmi <- renderPrint({
      if({input$name}==""){0}
      else
      {paste(calucateBMI(input$height,input$weight), "STATUS :: ", getRangeBMI(calucateBMI(input$height,input$weight)))}})
    
    output$mhr <- renderPrint({
      if({input$name}==""){0}
      else
      {calucateHeartRate(input$sex,input$age)}})
    
    output$consume <- renderPrint({
      if({input$name}==""){0}
      else
      {
        calculateCalorieConsumption(input$age, input$height, 
                                  input$weight, input$activity,input$sex,
                                input$wtLooseGain,input$days,input$weigthRadio)
    }})
    output$spend <- renderPrint({
      if({input$name}==""){0}
      else
      {
        
        caluculateCalorieSpent(input$wtLooseGain, input$days)}})
  }
  )