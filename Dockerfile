FROM centos:7

ARG parity_version
ENV PARITY_VERSION=${parity_version}

RUN yum update -y && yum install -y rpm-build rpmdevtools rpmlint
RUN useradd -ms /bin/bash rpmuser

COPY scripts/ /home/rpmuser/scripts
RUN chmod +x /home/rpmuser/scripts/tar.sh /home/rpmuser/scripts/rpm.sh

USER rpmuser
WORKDIR /home/rpmuser
