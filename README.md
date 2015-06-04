# docker-embulk

## Plugins

* embulk-input-mysql
* embulk-output-elasticsearch

## Usage

* show help

```
docker run --rm higebu/embulk --help
```

* run

```
docker run --rm -v `pwd`/config.yml:/config.yml higebu/embulk run /config.yml
```
