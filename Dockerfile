FROM openshift3/logging-fluentd:3.4.1

MAINTAINER Johnathan Kupferer <jkupfere@redhat.com>

# Download and deploy fluentd remote syslog plugin. No releases are provided
# for this plugin on gitlab, so need to pull from master.
RUN yum install -y  --enable-repo=rhel-7-server-optional-rpms \
      ruby-devel && \
    yum clean all && \
    fluent-gem install fluent-mixin-config-placeholders && \
    cd /tmp && \
    curl -Lo fluent-plugin-remote-syslog-master.tar.gz \
      https://github.com/docebo/fluent-plugin-remote-syslog/archive/master.tar.gz && \
    tar -zxf fluent-plugin-remote-syslog-master.tar.gz && \
    cp fluent-plugin-remote-syslog-master/lib/fluentd/plugin/* /etc/fluent/plugin/ && \
    rm -rf fluent-plugin-remote-syslog-master*
 
ADD run.sh ${HOME}/
