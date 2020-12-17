FROM alpine
MAINTAINER  kim5257@naver.com

COPY ./ /app/

WORKDIR /app

ENTRYPOINT ["/bin/sh", "run.sh"]