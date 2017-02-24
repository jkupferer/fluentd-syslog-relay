FROM openshift3/logging-fluentd:3.4.1

MAINTAINER Johnathan Kupferer <jkupfere@redhat.com>

# Download and deploy fluentd remote syslog plugin. No releases are provided
# for this plugin on gitlab, so need to pull from master.
RUN curl -o /tmp/fluent-plugin-remote-syslog-master.tar.gz \
      https://github.com/docebo/fluent-plugin-remote-syslog/archive/master.tar.gz && \
    tar -C /tmp -zxf fluent-plugin-remote-syslog-master.tar.gz && \
    cp /tmp/fluent-plugin-remote-syslog-master/lib/fluentd/plugin/* /etc/fluent/plugin/
 
ADD run.sh ${HOME}/
