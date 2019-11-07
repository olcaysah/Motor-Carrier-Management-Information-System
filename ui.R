#' Author: Olcay Sahin
#' Date: Thu Nov 06 10:45:46 2019
#' Author email: osahi001@odu.edu
#' Project:
#' Info:
#' --------------

fluidPage(
  titlePanel("Motor Carrier Management Information System (MCMIS)"),
    
    textOutput("keepAlive"),
    
    fluidRow(column(
      3,
      selectInput(
        "country",
        "Select Country",
        c(
          "United States" = "US",
          "Canada" = "CA",
          "Mexico" = "MX"
        ),
        selected = NULL,
        multiple = FALSE
      )
    ),
    column(
      3,
      conditionalPanel(
        "input.country",
        selectInput("states", "Select State", c("State" = ""), multiple = FALSE)
      )
    )),
    fluidRow(column(
      3,
      conditionalPanel("input.states",
                       downloadButton('downloadData', 'Download'))
    ))
    ,
    hr(),
    DT::dataTableOutput("table") %>% withSpinner(color = "#0dc5c1")
  
)