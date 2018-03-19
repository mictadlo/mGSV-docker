FROM php:5-apache

RUN apt-get update  && apt-get install -y --no-install-recommends \
                openjdk-7-jdk \
                maven  \
		git \
        && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/qunfengdong/mGSV.git

# Move the folder 'mgsv' to DocumentRoot of Apache web server. By default, the DocumentRoot of Apache is /var/www/ (speak to the system administrator to know the exact DocumentRoot).
RUN mv mGSV /var/www/ \
    && cd /var/www/mGSV \
    && mkdir tmp \
    && chmod -R 777 tmp

RUN cd /var/www/mGSV && sed -i.bak "s|'gsv'|'mgsv_user'|" lib/settings.php \ 
    && sed -i.bak "s|$database_pass = ''|$database_pass = 'mgsvpass'|" lib/settings.php \
    && sed -i.bak "s|cas-qshare.cas.unt.edu|localhost|" lib/settings.php

RUN cp /var/www/mGSV/Arial.ttf /usr/share/fonts/truetype/

#Do not understand
#7. Cleanup scripts are provided to drop database synteny and annotation tables, remove entries from database table 'userinfo' and delete the folder containing image files which are older than 60 days. This task is accomplished by cron job to run the cleanup script every day. To create a cron job, use the command below:
#	shell> crontab -e

#At the last line of crontab, copy and paste the line below, and provide the exact path to mgsv/lib/cleanup.php
#	30 04 * * * /var/www/mgsv/lib/cleanup.php

#The script cleanup.php will be executed at 4:30 AM every morning.

#8. mGSV uses the mail function from PHP to send email to users. Speak to your system administrator to provide required information in the PHP configuration file called 'php.ini'.

#9. When installation completes, you can now open Install/index.php (i.e., http://<YOUR_SERVER_DOMAIN_NAME>/mgsv/Install/), which verifies prerequisites, database setup, and installation. YOUR_SERVER_DOMAIN_NAME refers to the domain name of your server.


RUN cd /var/www/mGSV/ws \
    && tar -xzf mgsv-ws-server.tar.gz

RUN cd /var/www/mGSV/ws/mgsv-ws-server \ 
    && mvn package

RUN cp -f /var/www/mGSV/ws/mgsv-ws-server/target/ws-server-1.0RC1-jar-with-dependencies.jar /var/www/mGSV/ws/

RUN cd /var/www/mGSV/ws \ 
    && echo "mgsv_upload_url=http://localhost/mgsv" > config.properties \
    && echo "ws_publish_url=http\://localhost\:8081/MGSVService" >> config.properties \
    && java -jar ws-server-1.0RC1-jar-with-dependencies.jar &

#To stop the web service
#shell> ps aux | grep ws-server-1.0RC1-jar-with-dependencies.jar
#*Note the process id from the output*
#shell> kill -9 <process id>


