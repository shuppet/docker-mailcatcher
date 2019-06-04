FROM ruby:2.6-alpine

ARG BUILD_DATE
ARG BUILD_VERSION

LABEL org.opencontainers.image.created=$BUILD_DATE
LABEL org.opencontainers.image.version=$BUILD_VERSION

RUN set -ex; \
	\
	apk add --update --virtual build-dependencies \
		build-base \
		ruby-dev \
	; \
	apk add --update \
		libstdc++ \
		sqlite-dev \
	; \
	gem install mailcatcher -v $BUILD_VERSION --no-document; \
	apk del build-dependencies

EXPOSE 1080 1025

CMD ["mailcatcher", "--ip=0.0.0.0", "--foreground"]
