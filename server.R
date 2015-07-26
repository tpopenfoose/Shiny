library(shiny)
library(triangle)

shinyServer(function(input, output){
        dat <- reactive({
                dist <- rtriangle
                def.args <- c(input$a, input$b, input$c)

                f <- formals(dist); f <- f[names(f)!="n"]; len <- min(length(f), 4-1); f <- f[1:len]
                argList <- list(n=input$n)
                for(i in 1:len) argList[[names(f)[i]]] <- def.args[i]
                return(list(do.call(dist, argList), names(f)))
        })

        output$dist1 <- renderUI({
                input$dist
                isolate({
                        lab <- "a (lower limit of distribution):"
                        ini <- 0
                        numericInput(dat()[[2]][1], lab, ini)
                })
        })

        output$dist2 <- renderUI({
                input$dist
                isolate({
                        lab <- "b (upper limit of distribution):"
                        ini <- 10
                        numericInput(dat()[[2]][2], lab, ini)
                })
        })

        output$dist3 <- renderUI({
                input$dist
                isolate({
                        lab <- "c (mode of distribution):"
                        ini <- 5
                        numericInput(dat()[[2]][3], lab, ini)
                })
        })

        output$plot <- renderPlot({
                dist <- input$dist
                n <- input$n
                hist(dat()[[1]], main="", xlab="X", col="lightblue", cex.axis=1.2, cex.lab=1.2, prob=T)
                lines(density(dat()[[1]], adjust=input$bw), lwd=2)
        })

        output$summary <- renderPrint({summary(dat()[[1]])})

})
