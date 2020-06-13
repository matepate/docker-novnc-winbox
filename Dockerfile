FROM t4skforce/docker-novnc:latest

RUN set -xe && \
    apt-get update -y && \
    apt-get install -y --no-install-recommends wine wget && \
    rm -rf /var/lib/apt/lists && \
    mkdir -p /opt/winbox/ && \
    wget -q -c -O /opt/winbox/winbox64.exe "https://mt.lv/winbox64" && \
    echo "#!/bin/bash\nFREETYPE_PROPERTIES=\"truetype:interpreter-version=35\" wine /opt/winbox/winbox64.exe" > /opt/winbox/winbox64.sh && \
    chmod a+x /opt/winbox/winbox64.sh && \
    find /usr/share/applications/ -type f -not -name 'tint2.desktop' -delete

COPY ./templates/. /
