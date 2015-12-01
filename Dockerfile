FROM debian:jessie

MAINTAINER Théo Brigitte

ENV COUCHDB_VERSION=1.6.1

# Installation based on CouchDB installation guide
# http://docs.couchdb.org/en/1.6.1/install/unix.html
#
# Build and cleanup in one command for small image.
RUN apt-get update \
    && apt-get install -y -qq --no-install-recommends \
      curl \
      erlang-base-hipe \
      erlang-crypto \
      erlang-dev \
      erlang-nox \
      g++ \
      libicu52 \
      libicu-dev \
      libmozjs185-dev \
      make \

    && curl -sSL http://mirror.dkd.de/apache/couchdb/source/${COUCHDB_VERSION}/apache-couchdb-${COUCHDB_VERSION}.tar.gz | tar xvzf -  \
    && cd apache-couchdb-${COUCHDB_VERSION}/ \
    && ./configure && make && make install \
    && cd - && rm -rf apache-couchdb-* \

    && apt-get purge -y \
      binutils \
      cpp \
      cpp-4.9 \
      curl \
      erlang-dev \
      g++ \
      g++-4.9 \
      gcc \
      gcc-4.9 \
      icu-devtools \
      libasan1 \
      libatomic1 \
      libc-dev-bin \
      libc6-dev \
      libcilkrts5 \
      libcloog-isl4 \
      libcurl3 \
      libffi-dev \
      libgcc-4.9-dev \
      libgomp1 \
      libgssapi-krb5-2 \
      libicu-dev \
      libidn11 \
      libisl10 \
      libitm1 \
      libk5crypto3 \
      libkeyutils1 \
      libkrb5-3 \
      libkrb5support0 \
      liblsan0 \
      libmpc3 \
      libmpfr4 \
      libnspr4-dev \
      libquadmath0 \
      librtmp1 \
      libssh2-1 \
      libstdc++-4.9-dev \
      libtsan0 \
      libubsan0 \
      linux-libc-dev \
      make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY local.ini /usr/local/etc/couchdb/local.ini

VOLUME ["/data","/logs"]

CMD ["couchdb"]
