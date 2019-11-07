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
```
dbname = "name"
dbuser = "user"
dbpass = "password"
dbhost = "Ip address or localhost"
dbport = 5432 #Generally port for PostgreSQL is 5432. If you have multiple version check port number in postgres config
dbtable = "table name" #Not really necessary if you have multiple table in your database.
```
When an application or RStudio get started these information are loaded to environment. There are so many ways to protect your credentials which is explained in detail in Rstudio's maual page: https://db.rstudio.com/best-practices/managing-credentials/

## NGINX Web Server
Shiny server has it own port number (3838) to serve its applications. However I don't want to enable any port other than 80. Therefor I setup a proxy in Nginx web server. In this way you can set a subdomain from domain name provider (e.g., GoDaddy, Name.com, etc) and point to Virtual Server IP address. Since we added the proxy information to the NGINX server, it will handle the routing.

Anybody who are not familier with the server and proxy can copy the below configuration based on their information.

```
server {
    server_name mcmis.olcaysahin.com;
    root /opt/shiny-server/samples/mcmis/;
    gzip on;
    gzip_types text/plain text/css application/xml application/x-javascript;
    location / {
        proxy_set_header X-Real-IP  $remote_addr;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header Host $host;
        proxy_buffering off;
        proxy_read_timeout 300s;
        proxy_pass http://127.0.0.1:3838/mcmis/;
        client_max_body_size 1000m;
     }
}
```

## Symbolic Link
As you can see from the above RShiny Application folder located in the secure location. Therefore this location must be linked using Linux "Symbolic Link" command. See the example below:
```
ln -s /opt/shiny-server/samples/mcmis/ /srv/shiny-server/
```

Now the application can be seen under my porfolio's subdomain as: http://mcmis.olcaysahin.com