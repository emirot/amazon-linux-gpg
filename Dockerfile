FROM amazonlinux

RUN yum -y install bzip2 wget gcc make tar

COPY install_gpg.sh .
RUN chmod +x install_gpg.sh && ./install_gpg.sh

ENV PATH="/var/src/gnupg2/gnupg-2.2.15/dest/bin:$PATH"