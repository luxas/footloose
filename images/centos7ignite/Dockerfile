FROM luxas/ubuntu-base:18.10-2019-06-05 AS kernel
FROM centos:7

RUN yum -y install \
        sudo \
        procps-ng \
        net-tools \
        iproute \
        iputils \
        openssh-server \
        wget && \
    yum clean all

RUN echo root | passwd --stdin root

COPY --from=kernel /boot/vmlinux-4.19.47 /boot/vmlinux-4.19.47
COPY --from=kernel /boot/Kconfig-4.19.47 /boot/config-4.19.47
COPY --from=kernel /lib/modules/4.19.47 /lib/modules/4.19.47
RUN ln -s /boot/vmlinux-4.19.47 /boot/vmlinux

# ENV container docker
#RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
#systemd-tmpfiles-setup.service ] || rm -f $i; done); \
#rm -f /lib/systemd/system/multi-user.target.wants/*;\
#rm -f /etc/systemd/system/*.wants/*;\
#rm -f /lib/systemd/system/local-fs.target.wants/*; \
#rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
#rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
#rm -f /lib/systemd/system/basic.target.wants/*;\
#rm -f /lib/systemd/system/anaconda.target.wants/*;\
#rm -f /lib/systemd/system/*.wants/*update-utmp*;
# EXPOSE 22
# https://www.freedesktop.org/wiki/Software/systemd/ContainerInterface/
# STOPSIGNAL SIGRTMIN+3
# CMD ["/bin/bash"]
