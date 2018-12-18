FROM ruby:2.5.1

ENV PG_MAJOR 10.0

RUN apt-get update && \
    apt-get install -y build-essential autoconf libtool git && \
    apt-get clean

ENV LANG C.UTF-8
ENV GEM_HOME /bundle
ENV BUNDLE_PATH=$GEM_HOME \
  BUNDLE_APP_CONFIG=$BUNDLE_PATH \
  BUNDLE_BIN=$BUNDLE_PATH/bin \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3
ENV PATH /app/bin:$BUNDLE_BIN:$PATH

RUN mkdir -p /app
WORKDIR /app

ENTRYPOINT ["/bin/bash"]
