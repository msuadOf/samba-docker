FROM debian:latest
RUN apt-get update && \
    apt-get install -y --no-install-recommends samba samba-common-bin && \
    rm -rf /var/lib/apt/lists/* && \
    echo -e "123424\n123424" | smbpasswd -s -a  root && \
    useradd zz && echo -e "123424\n123424" | smbpasswd -s -a  zz 
EXPOSE 137/udp 138/udp 139 445
VOLUME ["/etc", "/var/cache/samba", "/var/lib/samba", "/var/log/samba",\
            "/run/samba"]
ENTRYPOINT ["/usr/sbin/smbd", "--foreground", "--no-process-group"]
