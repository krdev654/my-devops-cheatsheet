Kubernetes Commands:
-------------
* To check the version: `kubectl version`
* To create a deployment: `kubectl create deployment <deployment-name> --image=<image-name>`
* To manage and debug deployments: 
  - Get: `kubectl get deployments`
  - Describe: `kubectl describe deployment <deployment-name>`
  - To get the replicaset: `kubectl get replicaset or kubectl get rs`
  - Get Node details: `kubectl get nodes`
  - To get the pod details: `kubectl get pods`
  - To get services: `kubectl get services`
  - To get logs: `kubectl logs <pod-name>`
  - To get the pod container creation status: `kubectl describe pod <pod-name>`
  - To ssh into a container/pod: `kubectl exec -it <pod-name> -- bin/bash`. `bin/bash` is the shell of the container
  - To delete a deployment: `kubectl delete deployment <deployment-name>`
  - To watch the pod creation: `kubectl get pod --watch` or `kubectl describe pod <pod-name>`

---
### Namespaces in kubernetes
----
* What's namespace - to organize resources into sub-groups/clusters
* To get the namespaces: `kubectl get namespaces`
    ```
    - kube-system: system namespace for kubectl system resources
    - kube-public: publically accessible resources/data. You can get them using: kubectl cluster-info
    - kube-node-lease: to monitor the hearbeat of the nodes to track the availability
    - default:  default namespace for user created resources
    ```
* 
 
 ----
 ### Create and configure deployments and services using YAML files
 ---
 * Define the deployment information in an YAML file. For example: 
    ```
      ### my-deployment.yaml
      apiVersion: apps/v1
      kind: Deployment
      metadata:
        name: nginx-deployment
      spec:
        replicas: 1
        selector:
          matchLabels:
            app: nginx
        template:
          metadata:
            labels:
              app: nginx
          spec:
            containers:
            - name: nginx
              image: nginx:1.16
              resources:
                limits:
                  memory: "128Mi"
                  cpu: "500m"
              ports:
              - containerPort: 80
  
    ```
* Define a service yaml linking the deployment containers. For example:
    ```
      ### my-service.yaml
      apiVersion: v1
      kind: Service
      metadata:
        name: nginx-service
      spec:
        selector:
          app: nginx
        ports:
        - protocol: TCP
          port: 80
          targetPort: 8080


    ```
* Apply the configuration using: `kubectl apply -f my-deployment.yaml` and `kubectl apply -f my-service.yaml`
* To get the updated configuration of the deployment (with status): `kubectl get deployment nginx-deployment -o yaml`
------
### Sample startup application
-----

* kubectl create deployment hello-world-rest-api --image=in28min/hello-world-rest-api:0.0.1.RELEASE
* kubectl expose deployment hello-world-rest-api --type=LoadBalancer --port=8080
* kubectl scale deployment hello-world-rest-api --replicas=3
* kubectl delete pod hello-world-rest-api-58ff5dd898-62l9d
* kubectl autoscale deployment hello-world-rest-api --max=10 --cpu-percent=70
* kubectl edit deployment hello-world-rest-api #minReadySeconds: 15
* kubectl set image deployment hello-world-rest-api hello-world-rest-api=in28min/hello-world-rest-api:0.0.2.RELEASE
 
* gcloud container clusters get-credentials in28minutes-cluster --zone us-central1-a --project solid-course-258105
* kubectl create deployment hello-world-rest-api --image=in28min/hello-world-rest-api:0.0.1.RELEASE
* kubectl expose deployment hello-world-rest-api --type=LoadBalancer --port=8080
* kubectl set image deployment hello-world-rest-api hello-world-rest-api=DUMMY_IMAGE:TEST
* kubectl get events --sort-by=.metadata.creationTimestamp
* kubectl set image deployment hello-world-rest-api hello-world-rest-api=in28min/hello-world-rest-api:0.0.2.RELEASE
* kubectl get events --sort-by=.metadata.creationTimestamp
* kubectl get componentstatuses
* kubectl get pods --all-namespaces
 
* kubectl get events
* kubectl get pods
* kubectl get replicaset
* kubectl get deployment
* kubectl get service
 
* kubectl explain pods
* kubectl get pods -o wide
 
* kubectl describe pod hello-world-rest-api-58ff5dd898-9trh2
 
* kubectl get replicasets
* kubectl get replicaset
 
* kubectl scale deployment hello-world-rest-api --replicas=3
* kubectl get pods
* kubectl get replicaset
* kubectl get events
* kubectl get events --sort.by=.metadata.creationTimestamp
 
* kubectl get rs
* kubectl get rs -o wide
* kubectl set image deployment hello-world-rest-api hello-world-rest-api=DUMMY_IMAGE:TEST
* kubectl get rs -o wide
* kubectl get pods
* kubectl describe pod hello-world-rest-api-85995ddd5c-msjsm
* kubectl get events --sort-by=.metadata.creationTimestamp
 
* kubectl set image deployment hello-world-rest-api hello-world-rest-api=in28min/hello-world-rest-api:0.0.2.RELEASE
* kubectl get events --sort-by=.metadata.creationTimestamp
* kubectl get pods -o wide
* kubectl delete pod hello-world-rest-api-67c79fd44f-n6c7l
* kubectl get pods -o wide
* kubectl delete pod hello-world-rest-api-67c79fd44f-8bhdt
 
* gcloud container clusters get-credentials in28minutes-cluster --zone us-central1-c --project solid-course-258105
* docker login
* docker push in28min/mmv2-currency-exchange-service:0.0.11-SNAPSHOT
* docker push in28min/mmv2-currency-conversion-service:0.0.11-SNAPSHOT
 
* kubectl create deployment currency-exchange --image=in28min/mmv2-currency-exchange-service:0.0.11-SNAPSHOT
* kubectl expose deployment currency-exchange --type=LoadBalancer --port=8000
* kubectl get svc
* kubectl get services
* kubectl get pods
* kubectl get po
* kubectl get replicaset
* kubectl get rs
* kubectl get all
 
* kubectl create deployment currency-conversion --image=in28min/mmv2-currency-conversion-service:0.0.11-SNAPSHOT
* kubectl expose deployment currency-conversion --type=LoadBalancer --port=8100
 
* kubectl get svc --watch
 
* kubectl get deployments
 
* kubectl get deployment currency-exchange -o yaml >> deployment.yaml 
* kubectl get service currency-exchange -o yaml >> service.yaml 
 
* kubectl diff -f deployment.yaml
* kubectl apply -f deployment.yaml
 
* kubectl delete all -l app=currency-exchange
* kubectl delete all -l app=currency-conversion
 
* kubectl rollout history deployment currency-conversion
* kubectl rollout history deployment currency-exchange
* kubectl rollout undo deployment currency-exchange --to-revision=1
 
* kubectl logs currency-exchange-9fc6f979b-2gmn8
* kubectl logs -f currency-exchange-9fc6f979b-2gmn8 
 
* kubectl autoscale deployment currency-exchange --min=1 --max=3 --cpu-percent=5 
* kubectl get hpa
 
* kubectl top pod
* kubectl top nodes
* kubectl get hpa
* kubectl delete hpa currency-exchange
 
* kubectl create configmap currency-conversion --from-literal=CURRENCY_EXCHANGE_URI=http://currency-exchange
* kubectl get configmap
 
* kubectl get configmap currency-conversion -o yaml >> configmap.yaml
 
* watch -n 0.1 curl http://34.66.241.150:8100/currency-conversion-feign/from/USD/to/INR/quantity/10
 
* docker push in28min/mmv2-currency-conversion-service:0.0.12-SNAPSHOT
* docker push in28min/mmv2-currency-exchange-service:0.0.12-SNAPSHOT
------------------------
Notes:
-----------------------

```
- Deployment manages 
  - Replicaset manages
    - POD - an abstraction of
      - Container
```

* To create a base64 encoding from commandLine
    - `echo -n '<plain-text>' | base64`
* To assign an external ip in minikube: `minikube service <service-name>`
