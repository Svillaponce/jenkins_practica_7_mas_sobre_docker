FROM jenkins/jenkins
USER root

RUN apt-get update
RUN apt-get -y install apt-transport-https \
                       ca-certificates \
                       curl \
                       gnupg2 \
                       lsb-release \
                       software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get -y install docker-ce

RUN curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

RUN usermod -aG docker jenkins

USER jenkins
