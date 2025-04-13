FROM debian:bookworm
RUN apt-get update && \
    env DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends samba samba-common-bin systemctl && \
    rm -rf /var/lib/apt/lists/* && \
    echo -e "123424\n123424" | smbpasswd -s -a  root && \
    useradd zz && echo -e "123424\n123424" | smbpasswd -s -a  zz && \
    systemctl enable smbd && /sbin/service smbd enable 
EXPOSE 137/udp 138/udp 139 445
VOLUME ["/etc", "/var/cache/samba", "/var/lib/samba", "/var/log/samba",\
            "/run/samba"]
ENTRYPOINT ["/bin/bash"]
