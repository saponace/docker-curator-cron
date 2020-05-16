FROM alpine:3.9.6

ENV CURATOR_VERSION 5.8.1

ENV MAX_INDEX_AGE=0
ENV ELASTICSEARCH_HOST="http://elasticsearch"
ENV ELASTICSEARCH_PORT=9200

RUN apk --update add python py-pip bash && pip install --upgrade  elasticsearch-curator==${CURATOR_VERSION}

ADD docker-entrypoint.sh /
ADD scripts/optimize-indices.sh /scripts/
ADD scripts/purge-old-indices.sh /scripts/

RUN printf "\n*/5\t*\t*\t*\t*\t/scripts/purge-old-indices.sh" >> /etc/crontabs/root
RUN printf "\n*/5\t*\t*\t*\t*\t/scripts/optimize-indices.sh" >> /etc/crontabs/root

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["crond", "-f", "-l", "8"]
