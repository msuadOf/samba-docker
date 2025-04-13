FROM debian:bookworm
RUN apt-get update && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y samba samba-common-bin && \
    rm -rf /var/lib/apt/lists/* && \
    echo -e "123424\n123424" | smbpasswd -s -a  root && \
    useradd zz && echo -e "123424\n123424" | smbpasswd -s -a  zz && \
    /sbin/service smbd restart && /sbin/service smb enable 
EXPOSE 137/udp 138/udp 139 445
VOLUME ["/etc", "/var/cache/samba", "/var/lib/samba", "/var/log/samba",\
            "/run/samba"]
ENTRYPOINT ["/bin/bash"]
