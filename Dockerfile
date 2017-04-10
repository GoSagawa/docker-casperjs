FROM debian:jessie

ENV PHANTOMJS_VERSION=phantomjs-2.1.1-linux-x86_64

RUN apt-get update -y
RUN apt-get install -y libfreetype6-dev libfontconfig1-dev wget bzip2 unzip fontconfig git python

#install phantomjs
RUN wget --no-check-certificate https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOMJS_VERSION.tar.bz2
RUN tar xvf ${PHANTOMJS_VERSION}.tar.bz2
RUN mv $PHANTOMJS_VERSION/bin/phantomjs /usr/local/bin/
RUN rm -rf phantom*

#install Japanese font
RUN wget http://dl.ipafont.ipa.go.jp/IPAexfont/IPAexfont00301.zip
RUN unzip IPAexfont00301.zip
RUN mkdir -p /usr/share/fonts/ipa
RUN cp IPAexfont00301/*.ttf /usr/share/fonts/ipa
RUN fc-cache -fv 

#install casperjs
WORKDIR /root
RUN git clone https://github.com/n1k0/casperjs.git
RUN mv casperjs /opt/
RUN ln -sf /opt/casperjs/bin/casperjs /usr/local/bin/casperjs
RUN mkdir /home/casperjs

WORKDIR /home/casperjs

#setting for casperjs work as deamon
CMD tail -f /dev/null

