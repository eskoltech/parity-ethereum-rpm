FROM centos:7
RUN yum update -y && yum install -y rpm-build rpmdevtools rpmlint
WORKDIR /root
