FROM jenkins/jenkins:latest-jdk17
USER root
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update  -qq \
    && apt-get -y install docker-ce \
    && apt-get -y install jq \
    && apt-get install -y rsync \
    && apt-get install -y zip \
    && apt-get install -y vim

RUN jenkins-plugin-cli --plugins \
    workflow-multibranch:770.v1a_d0708dd1f6 \
    conditional-buildstep:1.4.3 \
    publish-over-ssh:1.25 \
    build-user-vars-plugin:1.9 \
    pipeline-stage-view:2.34 \
    cloudbees-folder:6.858.v898218f3609d \
    generic-webhook-trigger:1.88.2 \
    nodejs:1.6.1 \
    pipeline-utility-steps:2.16.0 \
    http_request:1.18 \
    pipeline-stage-step:305.ve96d0205c1c6 \
    ws-cleanup:0.45 \
    git:5.2.1 \
    docker-workflow:572.v950f58993843 \
    git-parameter:0.9.19 \
    ssh-agent:346.vda_a_c4f2c8e50 \
    ansicolor:1.0.4

RUN usermod -aG docker jenkins \
    && mkdir -p /var/jenkins_home/.ssh \
    && echo $'Host *\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile=/dev/null' > /var/jenkins_home/.ssh/config

USER jenkins