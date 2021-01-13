

kubectl -n monitor port-forward svc/query-api 33320:80 --address=10.1.1.1 &
Forwarding from 10.1.1.1:33320 -> 80

km scale sts tstack-prometheus --replicas=0