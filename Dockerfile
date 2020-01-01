FROM ubuntu

LABEL maintainer.name="hebo" maintainer.email="1113727572@qq.com"

ENV ID_PUB="none" VERSION="2019.3.1"

EXPOSE 22

RUN apt update \
 && apt install -y openssh-server \
 && mkdir /root/.ssh \
 && sed -i "s/#X11UseLocalhost yes/X11UseLocalhost no/g" /etc/ssh/sshd_config \
 && echo '#!/bin/bash\n\
test -f /root/.ssh/authorized_keys || echo "${ID_PUB}" > /root/.ssh/authorized_keys\n\
/etc/init.d/ssh start\n\
/bin/bash\n\
' > /entrypoint.sh && chmod +111 /entrypoint.sh

RUN apt update \
 && apt install -y openjdk-11-jdk openjdk-11-source openjdk-11-doc fonts-droid-fallback openjfx git \
 && wget -P /root/tmp https://download.jetbrains.com/idea/ideaIU-"${VERSION}".tar.gz \
 && mkdir /root/idea && tar -C /root/idea -axvf /root/tmp/ideaIU-"${VERSION}".tar.gz \
 && rm -r /root/tmp \
 && ln -s /root/idea/$(ls /root/idea)/bin/idea.sh /usr/bin/idea

CMD ["/entrypoint.sh"]
