FROM bestwu/wine:i386
LABEL maintainer='rlandjon <rlandjon@gmail.com'

RUN apt-get update && \
    apt-get install -y --no-install-recommends deepin.com.qq.office dbus-x11 && \
    apt-get -y autoremove --purge && apt-get autoclean -y && apt-get clean -y && \
    find /var/lib/apt/lists -type f -delete && \
    find /var/cache -type f -delete && \
    find /var/log -type f -delete && \
    find /usr/share/doc -type f -delete && \
    find /usr/share/man -type f -delete

ENV APP=TIM \
    AUDIO_GID=29 \
    VIDEO_GID=44 \
    GID=1000 \
    UID=1000

RUN groupadd -o -g $GID qq && \
    groupmod -o -g $AUDIO_GID audio && \
    groupmod -o -g $VIDEO_GID video && \
    useradd -d "/home/qq" -m -o -u $UID -g qq -G audio,video qq && \
    mkdir -p /home/software/Tencent/QQFiles && \
    chown -R qq:qq /home/software/Tencent/QQFiles && \
    ln -s "/home/software/Tencent/QQFiles" "/home/qq/Tencent Files" && \
    sed -i 's/TIM.exe" &/TIM.exe"/g' "/opt/deepinwine/tools/run.sh"

VOLUME ["/QQFiles"]

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
