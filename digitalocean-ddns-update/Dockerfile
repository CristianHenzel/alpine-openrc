FROM alpine:latest

RUN /sbin/apk add --no-cache \
	bash \
	curl \
	jq \
	tzdata

ADD ./init /init
RUN chmod +x /init

ENTRYPOINT ["/init"]
