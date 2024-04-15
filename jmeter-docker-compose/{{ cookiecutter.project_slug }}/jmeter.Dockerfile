FROM eclipse-temurin:21

RUN apt-get update \
    && apt-get -y install xterm \
    && apt-get clean

RUN mkdir -p /tmp/jmeter-installer \
    && cd /tmp/jmeter-installer \
    && curl -fsSL "https://dlcdn.apache.org/jmeter/binaries/apache-jmeter-5.6.3.tgz" -o "apache-jmeter-5.6.3.tgz" \
    && tar xvzf apache-jmeter-5.6.3.tgz \
    && mv apache-jmeter-5.6.3 /opt \
    && ln -s /opt/apache-jmeter-5.6.3 /opt/apache-jmeter \
    && echo "server.rmi.ssl.keystore.file=/opt/apache-jmeter-config/rmi_keystore.jks" >>/opt/apache-jmeter-5.6.3/bin/user.properties

ENV PATH="/opt/apache-jmeter/bin:${PATH}"

COPY run.sh /

CMD /run.sh

