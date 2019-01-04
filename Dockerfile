FROM centos:7

ARG parity_version
ENV PARITY_VERSION=${parity_version}

RUN yum update -y && yum install -y rpm-build rpmdevtools rpmlint
ADD scripts/ /opt/
RUN chmod +x /opt/tar.sh /opt/rpm.sh /opt/lint.sh

USER root
WORKDIR /root
