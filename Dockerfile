FROM hebo2019/ssh

ENV VERSION="2019.3.3"

RUN apt update \
 && apt install -y openjdk-11-jdk openjdk-11-source openjdk-11-doc fonts-droid-fallback openjfx git \
 && wget -P /root/tmp https://download.jetbrains.com/idea/ideaIU-"${VERSION}".tar.gz \
 && mkdir /root/idea && tar -C /root/idea -axvf /root/tmp/ideaIU-"${VERSION}".tar.gz \
 && rm -r /root/tmp \
 && ln -s /root/idea/$(ls /root/idea)/bin/idea.sh /usr/bin/idea

ENV NODEJS_VERSION="12.16.3"

RUN wget -P /root/tmp https://nodejs.org/dist/v12.16.1/node-v"${NODEJS_VERSION}"-linux-x64.tar.xz \
 && mkdir /root/nodejs && tar -C /root/nodejs -axvf /root/tmp/node-v"${NODEJS_VERSION}"-linux-x64.tar.xz \
 && rm -r /root/tmp \
 && ln -s /root/nodejs/$(ls /root/nodejs)/bin/node /usr/bin/node \
 && ln -s /root/nodejs/$(ls /root/nodejs)/bin/npm /usr/bin/npm \
 && ln -s /root/nodejs/$(ls /root/nodejs)/bin/npx /usr/bin/npx \
 && npm i -g npm

RUN mkdir -p "/root/.IntelliJIdea2019.3/config/jdbc-drivers/MySQL Connector/J 8/8.0.19" \
 && wget -O "/root/.IntelliJIdea2019.3/config/jdbc-drivers/MySQL Connector/J 8/8.0.19/mysql-connector-license.txt" \
         https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.19/LICENSE \
 && wget -O "/root/.IntelliJIdea2019.3/config/jdbc-drivers/MySQL Connector/J 8/8.0.19/mysql-connector-java-8.0.19.jar" \
         https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.19/mysql-connector-java-8.0.19.jar

CMD ["/entrypoint.sh"]
