# IHR Ops

Basic Kubernetes setup for running your own IHR.

# Components

1. Kafka cluster (3 brokers)
2. UI for inspecting Kafka
3. BGP CronJob (scheduled daily)
4. PeeringDB 2 CronJob: ix & netixlan (scheduled daily)

# requirements

- minikube. [install from here](https://minikube.sigs.k8s.io/docs/start/)


# Run

```
make setup
```

then

```
make run
```

to open kafka ui

```
make ui
```


# Todo

1. observability & monitoring