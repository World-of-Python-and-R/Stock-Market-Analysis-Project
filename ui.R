library(shiny)
library(tidyverse)
library(quantmod)
library(PerformanceAnalytics)
library(RColorBrewer)
library(tseries)
library(lubridate)
library(Quandl)
Quandl.api_key("zrcB2Ejv9UmvhPCUsy2_")
options("getSymbols.yahoo.warning"=FALSE)
options("getSymbols.warning4.0"=FALSE)

shinyUI(fluidPage(
    titlePanel("Stock Market Analysis"),
    sidebarLayout(
        sidebarPanel(
            selectInput("name", "Select Company:", c("Microsoft", "IBM", "Netflix", "Apple Inc.")),
            sliderInput("year", "Select Time Range:", min = 2008, max = 2021, value = c(2012, 2016), sep = "", pre = "Year "),
            selectInput("tech_ind", "Select Technical Indicators:", c("Bollinger Bands", "Relative Strength Index", 
                                                                             "Exponential Moving Averages", 
                                                                             "Moving Averages Convergence Divergence")),
            selectInput("trade_strat", "Select Trading Strategy:", c("Simple Buy Filter", "Simple Buy and Sell Filter", 
                                                                             "Relative Strength Index Buy Filter", 
                                                                             "Relative Strength Index Buy and Sell Filter")),
            submitButton("Chart!")
        ),
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Documentation", br(), strong("Select Company: "), "Select a company from the given list of 4 to chart. The default is Microsoft.",
                                 br(), strong("Select Time Range: "), "Choose for which years [from 2008 to 2021] should the charts be plotted. The default is from 2012 to 2016.",
                                 br(), strong("Select Technical Indicators: "), "Choose which Technical Indicators should be added to the plot. The default is Bollinger Bands.", 
                                 br(), strong("Select Trading Strategy: "), "Select which Trading Strategy should be used. The default is the Simple Buy Filter", 
                                 br(), "The charts are in the 'Charts' tab, while the trading strategies are in the 'Trading Strategies' tab",
                                 br(), "For more information, please see the accomapanying RStudio Presentation."),
                        tabPanel("Charts", br(), "The selected company is: ", strong(textOutput("symbol")),
                                 br(), "The Selected Time Range is from Year ", textOutput("year1"), " to Year ", textOutput("year2"),
                                 br(), "The Selected Technical Indicator is: ", textOutput("ta"),
                                 br(), plotOutput("chart1"),
                                 br(), plotOutput("chart2")),
                        tabPanel("Trading Strategies",
                                 br(), "The Selected Trading Strategy is: ", textOutput("ts"),
                                 br(), plotOutput("chart3"))
            )
        )
    )
))