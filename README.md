k3s-kube-prometheus
===================

Customized version of [kube-prometheus](https://github.com/coreos/kube-prometheus) to be lightweight.


### Installation

Run `kubectl apply` twice, to avoid [race condition](https://github.com/coreos/prometheus-operator/issues/1866#issuecomment-419191907).

```bash
kubectl apply -k github.com/premist/k3s-kube-prometheus
kubectl apply -k github.com/premist/k3s-kube-prometheus
```


### Development

To fetch upstream dependency, install [jsonnet](https://github.com/google/jsonnet) and [jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler), and run:

```bash
jb update
```

Once you have dependency installed on `vendor/` directory, run:

```bash
./build.sh
```

to generate manifests and kustomization.yml.
