# Motor-Carrier-Management-Information-System
RShiny application for downloading and visualizing Motor Carrier Management Information System (MCMIS) data

I wanted to have an example for downloading data from RShiny and PostgreSQL powered web application.

Using this application, data can be filtered and downloaded.

I will also include some simple analysis.

Data is open to public which can be downloaded from the following link: https://ai.fmcsa.dot.gov/SMS/Tools/Downloads.aspx
This data is get updated every month. I downloaded October 2019 dataset.
If I have time, I can write a PHP script to downloads and updates created database.

## Virtal Private Server Setup
I rented a low cost virtual private server from OVH ($4 per month (a cup of coffee!)) 1 vCore 2GB memory and 20GB SSD space.

## Database Setup
I created a local PostgreSQL database for the data. I could also use real-time read from file but it could take some time to read this data from file. This server is a low-cost server for lightweight works.

I will include the script for creating the table.

## Shiny Server Setup
Shiny server installation is straightforward. Just follow steps from official Rstudio tutorial: https://rstudio.com/products/shiny/download-server/ubuntu/

## Database Credentials protection
Since I am going to upload this script to the Github public, I am going to hide my credentials.

I created a .Renviron file and included all the credentials in this file as the following:

dbname = "name"

dbuser = "user"

dbpass = "password"

dbhost = "Ip address or localhost"

dbport = 5432 #Generally port for PostgreSQL is 5432. If you have multiple version check port number in postgres config

dbtable = "table name" #Not really necessary if you have multiple table in your database.
