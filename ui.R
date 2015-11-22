library(shiny)
set.seed(1000)
lambda = 0.2


shinyUI(pageWithSidebar(
    headerPanel("Investigation of Exponential Distribution"),
    sidebarPanel(
        sliderInput('n', 'Number of observations',value = 50, min = 5, max = 100, step = 1,),
        sliderInput('sim','Number of Simulations',value = 5000, min = 100, max = 10000, step = 10,)
    ),
    mainPanel(
        plotOutput('newHist'),
        h5('Sample Mean'),
        verbatimTextOutput("samplemean"),
        h5('Theretical Mean'),
        verbatimTextOutput("theoreticalmean"),
        h5('Expected Standard Deviation'),
        verbatimTextOutput("esd"),
        h5('Theretical Standard Deviation'),
        verbatimTextOutput("tsd")
    )
))