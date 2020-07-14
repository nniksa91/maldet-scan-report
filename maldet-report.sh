##################### Maldet Report Script

#!/bin/bash

##### Creating a scan #####

maldet -a `pwd` > /dev/null ;

var1=$(maldet --report list | cut -d "|" -f1 | awk '{print $1 "  " $2 }'| egrep -v "Linux|C|This"| awk 'NF > 0'| head -1)

var2=$(date | awk '{print $2 "  " $3}')

var3=$(maldet --report list |grep "$var2" |cut -d "|" -f2 | cut -d ":" -f2 |egrep -v "Linux|C|This" |awk 'NF > 0' | head -1)



##### Main Loop #####


if [ "$var1" == "$var2" ]

then


##### Specify the email for report #####


maldet --report $var3 (Email to which you want to send the report from the server)

fi