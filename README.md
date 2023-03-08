This project contains an automation script created to perform the following tasks:

#Perform an update of the package details and the package list at the start of the script.
#Install the apache2 package if it is not already installed.
#Ensure that the apache2 service is running. 
#Ensure that the apache2 service is enabled.
#Create a tar archive of apache2 access logs and error logs that are present in the /var/log/apache2/ directory and place the tar into the /tmp/ directory. Create a tar of only the .log files                                                              Hint : use timestamp=$(date '+%d%m%Y-%H%M%S') )
#The script should run the AWS CLI command and copy the archive to the s3 bucket. 

To run the script use command:

sudo  su
./root/Automation_Project/automation.sh

or 

sudo ./root/Automation_Project/automation.sh
