FROM hebo2019/ssh

ENV VERSION="2019.3.1"

RUN apt update \
 && apt install -y openjdk-11-jdk openjdk-11-source openjdk-11-doc fonts-droid-fallback openjfx git \
 && wget -P /root/tmp https://download.jetbrains.com/idea/ideaIU-"${VERSION}".tar.gz \
 && mkdir /root/idea && tar -C /root/idea -axvf /root/tmp/ideaIU-"${VERSION}".tar.gz \
 && rm -r /root/tmp \
 && ln -s /root/idea/$(ls /root/idea)/bin/idea.sh /usr/bin/idea

CMD ["/entrypoint.sh"]
