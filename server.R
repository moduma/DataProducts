library(shiny)
library(ggplot2)
set.seed(1000)

shinyServer(
    function(input, output) {
        output$newHist <- renderPlot({
            n <- input$n
            sim<-input$sim
            mns = NULL
            lambda=0.2
            for(i in 1:sim) mns = c(mns,mean(rexp(n,lambda)))
                        
            #Sample mean
            samplemean<-mean(mns)
            #theoretical mean
            theoreticalmean<-1/lambda
            
            #Expected sd
            esd<-sd(mns)
            #Theoretical sd
            tsd<-(1/lambda)/sqrt(n)
            
            #Expected variance
            evar<-(sd(mns))^2
            #Theoretical variance
            tvar<-((1/lambda)/sqrt(n))^2
            
            #Convert data to dataframe
            df<-data.frame(mns)
            
            output$samplemean <- renderPrint({samplemean})
            output$theoreticalmean <- renderPrint({theoreticalmean})
            output$esd <- renderPrint({esd})
            output$tsd <- renderPrint({tsd})
            
            ggplot(data = df, aes(mns))  + 
                geom_histogram(aes(y=..density..), fill = I('#ff0000'), 
                               binwidth = 0.05, color = I('black')) +
                stat_function(fun = dnorm, arg = list(mean = 5, sd = 0.7905694))
                
            
           
            
        })
        
    }
)