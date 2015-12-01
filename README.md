# CouchDB

Dockerized CouchDB `1.6.1` (Erlang `17.3`)

* Built on debian:jessie
* Image size 219.5 MB
* Volumes for data and logs
* CouchDB running on (default) port 5984

## Run
```
docker pull theo01/couchdb
docker run -d -p 5984:5984 theo01/couchdb
curl http://localhost:5984
```
