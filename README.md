# k8s-default-http-backend

After setting an ingress load balancer in a Kubernetes cluster, describing it may result in:

```txt
kubectl describe ingress
Name:             nginx-ingress
Namespace:        default
Address:          123.456.789.123
Default backend:  default-http-backend:80 (<error: endpoints "default-http-backend" not found>)
```

This repository just contains a small and simple implementation of the backend in Rust.

Running on `0.0.0.0:80`, it only exposes two urls:

1. `/healthz`: returns __200__
2. `/`: returns __404__

## Image with pre-build static binary

You can pull the image, which is _5.56mb_.

```bash
docker pull asciialex/k8s-default-http-backend:latest
docker run -p 80:80 asciialex/k8s-default-http-backend:latest

REPOSITORY                                  SIZE
asciialex/k8s-default-http-backend:latest   5.56MB
```
