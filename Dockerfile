FROM debian:bullseye

# Instalar Kamailio e Python
RUN apt-get update && \
    apt-get install -y kamailio kamailio-extra-modules python3 python3-pip && \
    pip3 install paho-mqtt && \
    rm -rf /var/lib/apt/lists/*

# Copiar configs
COPY kamailio.cfg /etc/kamailio/kamailio.cfg
COPY mqtt_bridge.py /etc/kamailio/mqtt_bridge.py
COPY publish_event.sh /etc/kamailio/publish_event.sh
RUN chmod +x /etc/kamailio/publish_event.sh

# Porta SIP
EXPOSE 5060/udp 5060/tcp

CMD ["kamailio", "-DD", "-E", "-f", "/etc/kamailio/kamailio.cfg"]

