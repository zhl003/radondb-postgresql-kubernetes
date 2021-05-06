# helm-charts
## 打包
1. `helm package postgresql-ha`
2. `helm repo index --url https://github.com/zhl003/helm-charts.git/ .`
## 部署
1. `helm repo add zhlrepo https://zhl003.github.io/helm-charts/`
2. `helm install zhlrepo/postgresql-ha`
~~~shell
root@i-n9rv1xq3:/home/ubuntu# helm search repo postgresql-ha
NAME                    CHART VERSION   APP VERSION     DESCRIPTION                                       
qingcloud/postgresql-ha   6.9.0           11.11.0         Chart for PostgreSQL with HA architecture (usin...
zhlrepo/postgresql-ha   7.0.0           11.11.0         Chart for PostgreSQL with HA architecture (usin...
~~~



