LoadData <- function(query){
  #set the database connection variable names
  dbname <- Sys.getenv('dbname'); dbuser <- Sys.getenv('dbuser'); dbpass <- Sys.getenv('dbpass');
  dbhost <- Sys.getenv('dbhost'); dbport <- Sys.getenv('dbport'); #where data are stored
  ## loads the PostgreSQL driver
  drv <- dbDriver("PostgreSQL")
  ## Open a connection
  con <- dbConnect(drv, host=dbhost, port=dbport, dbname=dbname, user=dbuser, password=dbpass)
  rs <- dbSendQuery(con, query)
  ## fetch all elements from the result set
  Data <- fetch(rs,n=-1)
  dbDisconnect(con)
  return(Data) 
}

dd <- LoadData("select * from fmcsa_table where phy_country = 'US' and phy_state ='AL';")
