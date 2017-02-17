library(shiny)
shinyUI(fluidPage(
  titlePanel("Roulette"),
  sidebarLayout(
    sidebarPanel(
      numericInput("Amount",
                   "The amount of money you are betting with",
                   min = 10,
                   max = 100,
                   value = 10),
      numericInput("Number",
                   "Which roulette number?:",
                   min = 0,
                   max = 36,
                   value = 10),
      radioButtons("Choice",
                   "What are you betting on?",
                   c("Number",
                     "Odd",
                     "Even",
                     "Black",
                     "Red")),
      actionButton("Action","Bet")
    ),
    mainPanel(
        tabsetPanel
        (
            tabPanel("Roulette",
                     tableOutput("outTable"),
                     tableOutput("StatHist"),
                     plotOutput("plot")),
            tabPanel("Documentation",
                     h2("Roulette"),
                     h3("A simple simulation of a roulette wheel."),
                     h5("This program let you practice betting strategies on a roulette table"),
                     h4("Input"),
                     h5("Amount: The amount of money you are betting with"),
                     h5("This amount will be subracted from your cash"),
                     h5("When you win, the amount wil be multiblied by a factor depending on your bet"),
                     h5("If you bet on a number the factor will be 35,"),
                     h5("If you bet on odd, even, black or red the factor will be 2"),
                     h5("Which roulette number?:Is used only if you choose to bet on a Number."),
                     h5("What are you betting on?: There are 5 possible choices:"),
                     h5("Number, Odd, Even, Black or white"),
                     h5("0 doesn't count as an even number and is'n black or white!!!"),
                     h4("Output:"),
                     h5("A table with the current betting data"),
                     h5("A table with the number and the relative number of Odd, Even, Black and Red."),
                     h5("A barplot with the preceding numbers"),
                     h4("[Bet]"),
                     h5("If you press bet, a new number will be generated and you place your bet!"),
                     h3("Good Luck!!!"))

        )


    )
  )
))
