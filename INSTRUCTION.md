# Validation Instructions

1. **Verify Pods:**
Check the status of the pods to ensure they are correctly deployed:
MySQL Cluster:
```bash
kubectl get pods -n mysql
```   
there should be 3 replicas (mysql-0, mysql-1, mysql-2).

```bash
kubectl get pods -n todoapp
```
the todoapp pod should be running.

2. **Verify Database Connection:**
   Check the application logs to confirm a successful connection to the database: 
```bash
kubectl logs deploy/todoapp -n todoapp`.
```

3. **Verify Services:**
```bash
   kubectl get svc -n mysql (verify the Headless service is present)
   kubectl get svc -n todoapp (verify the NodePort is accessible on port 30007).
```