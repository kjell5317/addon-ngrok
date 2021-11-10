ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN set -x \
    # Install ngrok (latest official stable from https://ngrok.com/download).
    && apk add --no-cache curl \
    && curl -Lo /ngrok.zip https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip \
    && unzip -o /ngrok.zip -d /bin \
    && rm -f /ngrok.zip

RUN ngrok --version

COPY run.sh /
COPY update.sh /
COPY template.yml /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]