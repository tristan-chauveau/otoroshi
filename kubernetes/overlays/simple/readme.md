# Simple deployment

here we only deploy 2 replicas of the same otoroshi instance using redis. 

It uses a service of type `LoadBalancer` so it's intended to run in a kubernetes cluster where external loadbalancer are supported

You'll also have to configure your DNS to route otoroshi domain names to the loadbalancer of your kubernetes cluster

## DNS config. example

```
otoroshi.your.otoroshi.domain      IN CNAME generated.cname.of.your.cluster.loadbalancer
otoroshi-api.your.otoroshi.domain  IN CNAME generated.cname.of.your.cluster.loadbalancer
privateapps.your.otoroshi.domain   IN CNAME generated.cname.of.your.cluster.loadbalancer
api1.another.domain                IN CNAME generated.cname.of.your.cluster.loadbalancer
api2.another.domain                IN CNAME generated.cname.of.your.cluster.loadbalancer
*.api.the.api.domain               IN CNAME generated.cname.of.your.cluster.loadbalancer
```