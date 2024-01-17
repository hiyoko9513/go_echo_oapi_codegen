# go echo oapi codegen
## quick start
前提環境
- local go
- docker
- mac

```shell
$ make quick-start
```
http://lvh.me:8080/v1/pets

web server の停止
```shell
$ lsof -i :8080  | tail -n 1 | awk '{print $2}' | xargs kill -9
```


## command list
1. swaggerのuiを立ち上げ
```shell
$ make docker/swagger/run
```
http://lvh.me:8081
