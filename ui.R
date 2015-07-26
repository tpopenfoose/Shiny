library(shiny)
library(shinythemes)

shinyUI(fluidPage(theme=shinytheme("cerulean"),
                  headerPanel(HTML('Triangle Distributions'), "Triangle Random Variable Distributions"),
                  fluidRow(
                      column(6,
                             wellPanel(
                                 helpText("Help for this App:  this app is to plot and summarize samples from a triangle distribution.  ",
                                          "A triangle distribution has a min (a, the lower limit), a max (b, the upper limit)",
                                          "and the midpoint (c, the mode of the distribution).  ",
                                          "Below you can change the number of random samples drawn with the slider.  ",
                                          "You can change the values of \"a\", \"b\" and \"c\".  \"c\" must be greater than or equal to \"a\" and \"c\" ",
                                          "must also be less than or equal to \"b\"!  You can also change the bandwidth for the density plot."),
                                 br(), hr(), br(),
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
