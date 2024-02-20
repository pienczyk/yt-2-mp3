# Multi arch
FROM alpine:3.18

LABEL maintainer="pien@o2.pl" platform="linux/amd64, linux/arm/v7" email="pien@o2.pl"

ARG TARGETARCH
WORKDIR /tmp
RUN if [ "$TARGETARCH" = "arm64" ]; then \
            ffbin="arm-64"; \
        elif [ "$TARGETARCH" = "amd64" ]; then \
            ffbin="64"; \
    fi && \
    apk add --update wget zip python3 &&  \
    wget https://github.com/ffbinaries/ffbinaries-prebuilt/releases/download/v6.1/ffmpeg-6.1-linux-$ffbin.zip && \
    wget https://github.com/ffbinaries/ffbinaries-prebuilt/releases/download/v6.1/ffprobe-6.1-linux-$ffbin.zip && \
    for f in $(ls -alx *.zip);do unzip $f && rm -f $f; done && \
    wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp && \
    chmod +x yt-dlp && \
    mv yt-dlp /usr/local/bin/ && \
    mv ffmpeg /usr/local/bin/ && mv ffprobe /usr/local/bin/ && \
    mkdir /download && \
    apk del wget zip && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*
WORKDIR /download
ENTRYPOINT ["yt-dlp"]
