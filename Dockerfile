FROM openshift3/logging-fluentd:3.4.1

MAINTAINER Johnathan Kupferer <jkupfere@redhat.com>

ADD run.sh generate_throttle_configs.rb ${HOME}/
