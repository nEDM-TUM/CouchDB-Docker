FROM klaemo/couchdb:1.6.1

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends python python-pip

RUN pip install cloudant

COPY ./docker-entrypoint.sh /overload-entrypoint.sh
COPY ./couchdb_updater.py /couchdb_updater.py
COPY ./couchdb_alarm_daemon.py /couchdb_alarm_daemon.py

COPY ./local.ini /local.ini
ENTRYPOINT ["/overload-entrypoint.sh"]
CMD ["couchdb"]
