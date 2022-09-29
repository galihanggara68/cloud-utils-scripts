# Cloud Utils Scripts
## Struktur Folder
`backup-configmap.sh` -> Backup configmap dari cloud ke local
`configmap.sh` -> Set config json dari local ke cloud 
`rollout.sh` -> Restart deployment
Struktur folder di atas itu `<envi>/clusters/<nama cluster>/<namespace>` contoh `example/clusters/example-cluster/example`
Di dalam namespace itu ada folder yang merepresentasikan deployment dengan format `<deployment>-appsettings`, di dalam masing-masing folder itu ada `deployment.yaml` yang isinya configuration yaml untuk deploy workload ke cloud, dan file config yang isinya config untuk deployment

## Penggunaan Script
`<command>.sh -n <namespace> -d <deployments>`

`<namespace>` -> namespace workload/deployment, contoh: example
`<deployments>` -> comma separated workload/deployment, contoh: `example-frontend` atau `example-engine,example-backend`

Backup configmap atau tarik configmap dari cloud ke local => bisa run command `backup-configmap.sh -n example -d approval-engine`
Apply atau reconfigure configmap => bisa run command `configmap.sh -n example -d example-engine,example-backend` , tapi pastikan file config deployment terkait itu udah ada di dalem folder deployment
Rollout/Restart deployment => bisa run command `rollout.sh -n example -d example-fe,example-engine`
