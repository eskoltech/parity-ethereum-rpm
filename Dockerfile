FROM centos:7

ARG parity_version
ENV PARITY_VERSION=${parity_version}

RUN yum update -y && yum install -y rpm-build rpmdevtools rpmlint
RUN useradd -ms /bin/bash rpmuser

ADD scripts/ /opt/
RUN chmod +x /opt/tar.sh /opt/rpm.sh

USER rpmuser
WORKDIR /home/rpmuser
