#' Author: Olcay Sahin
#' Date: Thu Nov 06 10:45:29 2019
#' Author email: osahi001@odu.edu
#' Project:
#' Info:
#' --------------

function(input, output, session) {
  observe({
    if (is.null(input$country))
      character(0)
    else {
      switch(
        input$country,
        'US' = updateSelectInput(
          session,
          "states",
          choices = structure(state.abb, names = state.name)
        ),
        'MX' = updateSelectInput(
          session,
          "states",
          choices = structure(mx_states$Abbreviation, names = mx_states$State)
        ),
        'CA' = updateSelectInput(
          session,
          "states",
          choices = structure(ca_states$Abbreviation, names = ca_states$State)
        )
      )
    }
  })
  
  output$table <- DT::renderDataTable({
    DT::datatable(myout(), escape = FALSE)
  })
  
  myout = reactive({
    LoadData(
      paste0(
        'select * from ',
        Sys.getenv('dbtable'),
        ' where phy_country = \'',
        input$country,
        '\' and phy_state =\'' ,
        input$states,
        '\';'
      )
    )
  })
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste(input$country,
            '-',
            input$states,
            '-',
            Sys.Date(),
            '.csv',
            sep = '')
    },
    content = function(file) {
      write.csv(myout(), file, row.names = F)
    }
  )
}