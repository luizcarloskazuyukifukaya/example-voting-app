echo "Install exporters with helm chart"
echo "redis exporter"
helm upgrade prometheus-redis-exporter \
  prometheus-community/prometheus-redis-exporter -n prometheus --install -f redis-values.yaml
echo "db (postgres) exporter"
helm upgrade prometheus-db-exporter \
  prometheus-community/prometheus-postgres-exporter -n prometheus --install -f db-values.yaml
