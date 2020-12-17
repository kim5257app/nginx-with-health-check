FROM alpine
MAINTAINER  kim5257@naver.com

RUN apk update

RUN apk add git g++ patch pcre-dev zlib-dev make

COPY ./ /src/

WORKDIR /src

RUN git clone https://github.com/yaoweibin/nginx_upstream_check_module
RUN wget https://nginx.org/download/nginx-1.16.1.tar.gz

RUN tar xf nginx-1.16.1.tar.gz

WORKDIR /src/nginx-1.16.1

RUN patch -p1 < ../nginx_upstream_check_module/check_1.16.1+.patch

RUN ./configure --add-module=../nginx_upstream_check_module

RUN make
RUN make install

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
