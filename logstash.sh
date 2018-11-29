
#!/bin/bash

if [ `ps -ef | grep java | grep logstash | wc -l` -ne 1 ]
        then
                echo "$HOSTNAME Logstash not running"
        else
                echo "$HOSTNAME Logstash running"
fi


if [ `netstat -napo | grep 9000 | grep udp | grep java | wc -l` -lt 1 ]
        then
                echo "$HOSTNAME Logstash possibly not listening on UDP 9000"
        else
                echo "$HOSTNAME Logstash appears to be listening properly"
fi

if [ `netstat -natpo | grep '192.168.137' | grep java | grep ESTABLISHED | wc -l` -lt 1 ]
        then
                echo "$HOSTNAME Logstash possibly not connecting to Elasticsearch"
        else
                echo "$HOSTNAME Logstash appears to be outputting to Elasticsearch"
fi


