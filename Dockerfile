FROM alpine:edge
LABEL Maintainer="Niels Hüsken" \
      Description="Lightweight Mosquitto MQTT server based on Alpine Linux."

# Install packages
RUN apk --no-cache add mosquitto mosquitto-clients

# Expose MQTT port
EXPOSE 1883

# Add config
ADD mosquitto.conf /mosquitto.conf

ENV PATH /usr/sbin:$PATH

USER nobody

ENTRYPOINT ["/usr/sbin/mosquitto", "-c", "/mosquitto.conf"]
