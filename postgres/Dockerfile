FROM ubuntu:20.04

ENV LANG es_ES.UTF-8
#ENV PG_PASSWORD
ENV PG_VERSION 12
ENV PG_BASE /var/lib/postgresql
ENV PG_PASSWORD_FILE ${PG_BASE}/pwfile
ENV PG_DATA ${PG_BASE}/${PG_VERSION}/main
ENV PG_CONFIG_DIR /etc/postgresql/${PG_VERSION}/main
ENV PG_CONFIG_FILE ${PG_CONFIG_DIR}/postgresql.conf
ENV PG_BINDIR /usr/lib/postgresql/${PG_VERSION}/bin

RUN apt update 

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Madrid
RUN apt-get install -y tzdata

RUN apt update && apt install locales && locale-gen $LANG && update-locale LANG=$LANG

RUN apt-get install -y postgresql-12 \
    postgresql-client-12 \
    postgresql-contrib-12 \
    postgresql-doc-12 \
    python \
    python3 \
    pwgen \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

COPY docker-entrypoint.sh /usr/local/bin/

RUN rm -rf "$PG_BASE" && mkdir -p "$PG_BASE" && chown -R postgres:postgres "$PG_BASE" \
    && mkdir -p /var/run/postgresql/$PG_VERSION-main.pg_stat_tmp \
    && chown -R postgres:postgres /var/run/postgresql && chmod g+s /var/run/postgresql \
    && chmod +x /usr/local/bin/docker-entrypoint.sh

RUN echo "host all  all    0.0.0.0/0  md5" >> $PG_CONFIG_DIR/pg_hba.conf \
    && echo "host all  all    ::/0  md5" >> $PG_CONFIG_DIR/pg_hba.conf \
    && echo "listen_addresses='*'" >> $PG_CONFIG_FILE

USER postgres
ENV LANG es_ES.UTF-8

VOLUME ["${PG_BASE}"]

EXPOSE 5432

ENTRYPOINT ["docker-entrypoint.sh"]
