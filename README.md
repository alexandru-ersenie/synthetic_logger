# synthetic_logger
Synthetic logger for testing fluent/tdagent configurations

For testing purposes we will use synthetic log files that simulate payara json logs:
* normal logs without stacktraces 
* json logs with stacktraces that are not being split (under 16000 bytes)
* json logs with stacktraces that are being split because they are too large, and need to be concatenated into single message


We will push these logs using the fluent logging driver, which will forward the logs to the daemon we started above. By
doing this we simulate exactly the docker logging format that is being used in Kubernetes


### Start synthetic logger

This will start an alpine image forwarding logs to the fluentd daemon

```docker rm -f logger1; docker run --name logger1 -it --log-driver=fluentd --log-opt tag=loggf.{{.ID}} -v $(pwd):/root/test alpine cat /root/test/out.log```

