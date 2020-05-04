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

Install dependencies first:

```bash
# Install go and go port of jsonnet for performance
brew install go go-jsonnet

# Install jsonnet bundler
GO111MODULE="on" go get github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb

# Install gojsontoyaml for converting output to yaml
go get github.com/brancz/gojsontoyaml
```

Once dependencies are installed and GOPATH is added to your PATH, run:

```bash
jb update
```

Once you have jsonnet dependencies bundled at `vendor/`, run:

```bash
./build.sh
```

to generate manifests and kustomization.yml.
