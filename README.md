[h2o http server](https://h2o.examp1e.net)

```
$ docker run -p 8080:8080 comameito/h2o
$ curl localhost:8080
<h1>Hello, world!</h1>
```

Configs files shoud be placed in `config/`. The main config file is `config/h2o.conf`.
Your static files are in `public/`.
