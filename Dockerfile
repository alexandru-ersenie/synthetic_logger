# Syntetic logger, will output the contents of out.log every 10 seconds
FROM alpine:3.7
ADD out.log .
CMD /bin/sh -c "while true; do cat out.log && sleep 600; exit 1; done" 
