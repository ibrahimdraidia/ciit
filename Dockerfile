FROM ruby:2.4.3-alpine3.7

ENV BUILD_PACKAGES bash shadow postgresql-dev
ENV RUBY_PACKAGES ruby-bigdecimal

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/* && \
    useradd buyco -m  

# switch to root 
USER root

# make and g++ are used to compile native gems 
RUN apk update && apk add make g++

# switch back to buyco user
USER buyco
