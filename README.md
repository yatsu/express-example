# express-example

Node.js/Express example app.

## Running in Local

```sh
$ make run
```

```sh
$ curl -H "Content-Type: application/json" -X POST -d '{"a": 1}' http://localhost:8080/example/foo | jq .
```

## Deploying to Kubernetes Cluster

[Helm](https://helm.sh/) is required to do this.

```sh
$ USERNAME=alice make image
$ USERNAME=alice make push
```

```sh
$ NAMESPACE=example USERNAME=alice make helm-install
```

If you have installed Ambassador, the URL endpoint becomes ready.

```sh
$ curl -k -H "Content-Type: application/json" -X POST -d '{"a": 1}' https://<ip>/example/foo | jq .
```

## See Also

* [Dockerizing a Node.js web app | Node.js](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/)
