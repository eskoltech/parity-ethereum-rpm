FROM centos:7

ARG parity_version
ENV PARITY_VERSION=${parity_version}

RUN yum update -y && yum install -y rpm-build rpmdevtools rpmlint
WORKDIR /root
