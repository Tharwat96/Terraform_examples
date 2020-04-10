FROM jenkins/jenkins:lts
# volume for Jenkins settings
VOLUME /var/jenkins_home
USER root
WORKDIR /initialization


# installing terraform
# RUN pwd
# ADD https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip /initialization
# RUN pwd
# RUN unzip terraform*.zip
# RUN mv terraform /bin
RUN curl https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip > terraform.zip \
&& unzip /initialization/terraform*.zip -d /bin \
&& rm -r /initialization/ \
&& cd /

# java env variable to skip setup wizard
# ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
USER jenkins


# Inform Docker that the container is listening on the specified port at runtime.
# EXPOSE 8080/tcp