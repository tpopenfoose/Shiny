library(shiny)
library(shinythemes)

shinyUI(fluidPage(theme=shinytheme("cerulean"),
                  headerPanel(HTML('Triangle Distributions'), "Triangle Random Variable Distributions"),
                  fluidRow(
                      column(6,
                             wellPanel(
                                 sliderInput("n", "Sample size:", 1, 10000, 5000),
                                 br(), hr(), br(),
                                 uiOutput("dist1"),
                                 uiOutput("dist2"),
                                 uiOutput("dist3"),
                                 br(), hr(), br(),
                                 numericInput("bw", "Density Curve Bandwidth:", 2)
                                 )
                             ),

                      column(6,
                             plotOutput("plot", height="600px"),
                             verbatimTextOutput("summary")
                            )
                      )
                  )
        )
