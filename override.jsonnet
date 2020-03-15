local k = import 'ksonnet/ksonnet.beta.4/k.libsonnet';

{
  _config+:: {
    namespace: 'monitoring',

    prometheus+:: {
      names: 'k8s',
      replicas: 1,
      namespaces: ['default', 'kube-system', 'monitoring'],
    },

    alertmanager+:: {
      replicas: 1,
    },
  },
}
