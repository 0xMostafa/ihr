setup:
	@minikube stop; minikube start --memory=4096
	@echo "Started minkube ✅"
	@kubectl apply -f kafka
	@kubectl create -f 'https://strimzi.io/install/latest?namespace=default'
	@echo "Installed Kafka Operator ✅"
	# @echo "Started Observability"
	
run:
	@echo "Start Kafka..."
	@kubectl apply -f kafka/kafka.yaml
	@echo "Kafka Deployed ✅"

jobs:
	@echo "Start Scheduling ETL CronJobs..."
	@echo "Schedule PeeringDB CronJob..."
	@kubectl apply -f etl/peeringdb.yaml
	@echo "Scheduled 2 PeeringDB CronJobs (ix & netixlan) ✅"
	@echo "Schedule BGP CronJob..."
	@kubectl apply -f etl/bgp.yaml
	@echo "Scheduled 1 BGP CronJobs (rrc00) ✅"

stop:
	@minikube stop

status:
	@kubectl get all

ui:
	@minikube service kafka-ui-service

clean:
	@kubectl delete -f kafka/kafka.yaml
	@kubectl delete -f etl/bgp
	@kubectl delete -f etl/peeringdb
	@echo "Deleted Kafka ✅"
	@kubectl delete all --all
	@echo "Deleted everything else ✅"
