
## Build image

```
docker build -t lunch .
```

use the new image
```
docker run -d  -p 8080:80 lunch  nginx -g 'daemon off;'
```

## Image tags

```
docker build -t lunch:v1 .
docker run -d  -p 8081:80 lunch:v1
```

add `EXPOSE 80` to Dcokerfile
```
docker build -t lunch:v2 .
```


use the new image
```
docker run -dP lunch:v2
```

## git repo 

```
cd ..
git clone https://github.com/lalyos/docker-nisz
cd docker-nisz
```

build image from git repo
```
docker build -t lunch:git https://github.com/lalyos/docker-nisz.git
```

## Image from docker hub

```
docker run -dP lalyos/12factor:v2.0
```

# Networking

```
docker network ls
docker network create blue
docker network inspect blue
```

# Volumes


```

mkdir sql
curl -s https://raw.githubusercontent.com/lalyos/docker-nisz/refs/heads/master/sql/init.sql -o ./sql/init.sql

docker rm -f db
docker volume rm db_food
docker run -d --rm \
  --name db \
  --net=blue \
  -v $PWD/sql:/docker-entrypoint-initdb.d \
  -v db_food:/var/lib/postgresql/data \
  -e POSTGRES_PASSWORD=secret \
  postgres:17
```

list foods
```
alias food="docker exec db  psql -U postgres postgres -c 'select * from food;'"
```


## Adminer

```
docker run -dP --net=blue adminer
```

## Devcontainer

```
docker run -it --rm   -v $PWD:$PWD -w $PWD node:23 bash
```