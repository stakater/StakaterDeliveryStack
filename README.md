# StakaterDeliveryStack
A Stack to Setup delivery(CI/CD) Apps on Kubernetes Cluster via Helm Charts  i.e. Jenkins, Nexus, Chartmuseum etc.

# How to deploy manually
0. Replace all variables mentioned below in the files/folders according to the cloud provider 
1. Make sure `kubectl` is configured correctly with your kubernetes cluster. i.e. `~/.kube/config`
2. Create a new namespace `delivery` in the cluster.
```
kubectl create namespace delivery
```
3. Switch directory to `manifests` folder
```
cd manifests
```
4. Run the following command
```
kubectl apply -f . -n delivery
```
5. If you want to deploy PVCs deploy PVCs with the following command
```
cd pvc/
kubectl apply -f . -n delivery
```
6. It will take 3-4 minutes for kubernetes to completely reflect all the changes on the dasboard.



# Variables to replace
REPLACE_DOMAIN_NAME: Domain name to expose applications e.g stakater.com
REPLACE_ADMIN_ACCOUNT: base64 string for admin account json
REPLACE_CLUSTER_ACCOUNT: base64 string for cluster account json
REPLACE_HOSTNAME: e.g. `jenkins.REPLACE_NAMESPACE.REPLACE_DOMAIN_NAME`
REPLACE_NAMESPACE: Namespace to deploy in Kubernetes
REPLACE_ISSUER: keycloak issuer e.g.`https://keycloak.example.domain.com/auth/realms/example-realm`
REPLACE_SECURITY_REALM: Security Realm XML object
REPLACE_PROVIDER_CONFIG: Provider config JSON object enclosed in `"`
REPLACE_CLIENT_ID: Keycloak client ID
REPLACE_CLIENT_SECRET: Keycloak client secret