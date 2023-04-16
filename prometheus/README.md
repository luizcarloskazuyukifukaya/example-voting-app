# Prometheus ServiceMonitor
This includes details of the ServiceMonitor defined for prometheus to monitor
the application itself.

## References
* [Postgres-exporter](https://hub.docker.com/r/bitnami/postgres-exporter)
* [Redis-exporter](https://hub.docker.com/r/bitnami/redis-exporter)
* [Prometheus Community Helm Charts](https://github.com/prometheus-community/helm-charts)

## Exporter with Helm Charts
If the exporter is provided with helm charts, you can install it with
a configuration provided with YAML specified at the installation.

### Installing the Chart
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install [RELEASE NAME] [chart name] -f [value.yaml]
```

<b>redis</b>
```
helm install [RELEASE_NAME] prometheus-community/prometheus-redis-exporter
```
```
helm upgrade [RELEASE_NAME] prometheus-community/prometheus-redis-exporter --install
```

<b>portgres</b>
```
helm install [RELEASE_NAME] prometheus-community/prometheus-postgres-exporter
```
```
helm upgrade [RELEASE_NAME] prometheus-community/prometheus-postgres-exporter --install
```

### Helm Charts
You can search the available chart by the following command:
```
helm search repo prometheus-community | grep helm | grep [target keyword (ex. "redis")]
```

* helm/prometheus-community/prometheus-redis-exporter


## Custom Defined ServiceMonitor
* vote service
* result service
