# Kubernetes

Idk what I'm doing with Kubernetes so this is my very public attempt at learning

## Minikube

```
minikube start
```


## Flux

Setup flux:

```
flux bootstrap github --owner=ethancedwards8 --repository=homelab --branch=main --path=./clusters/minikube --personal
```

had to do weird PAT stuff:
content: read/write
administration: read/write
metadata: read
