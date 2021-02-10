FROM alpine:latest

RUN /sbin/apk add --no-cache \
	bash \
	curl \
	jq

ADD ./init /init

ENTRYPOINT ["/init"]
