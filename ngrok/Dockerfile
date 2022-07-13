ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apk update && \
    apk add --no-cache git curl python3 py3-pip \
    && curl -Lo /ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip \
    && unzip -o /ngrok.zip -d /bin \
    && rm -f /ngrok.zip \
    && pip install --no-cache-dir git+https://github.com/Schmetzler/Freenom-dns-updater.git

COPY run.sh update.sh template.yml /
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
