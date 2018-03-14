# README

Sample Docker Implementation of Solidus using Postgres

## Requirements

- Docker
- Docker Compose
- [Docker Sync](http://docker-sync.io/)

## Install

To run, do the following:

```
docker-sync start
docker-compose build
docker-compose run --rm app bundle exec rake db:setup spree_sample:load
docker-compose up
```

Navigate your browser to http://localhost:3000/

To terminate run

```
docker-compose down
```
