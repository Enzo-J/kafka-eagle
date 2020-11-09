FROM java:8-alpine
ENV version=2.0.2
ENV KE_HOME=/kafka-eagle
COPY kafka-eagle-web-${version}-bin.tar.gz kafka-eagle-web-${version}-bin.tar.gz 
RUN  tar -xzvf kafka-eagle-web-${version}-bin.tar.gz && \
     mv kafka-eagle-web-${version} /kafka-eagle && \
     rm -rf $v{version}.tar.gz kafka-eagle-bin-${version} && \
     chmod +x /kafka-eagle/bin/ke.sh
WORKDIR /kafka-eagle
COPY system-config.properties ./conf/system-config.properties
COPY run ./
RUN chmod +x run
ENTRYPOINT ["sh","run"]
