
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