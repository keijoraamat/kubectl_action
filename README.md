# kubectl_action
GitHub action to run kubectl commands
Differs from many others base64 decodeing with ignoring garbage [base64 man page](https://linux.die.net/man/1/base64)
**Required** base64 encoded kubeconfig as GitHub secret.
### Encode cubeconfig:
`cat <your .kube/config> | base64`

## Usage
`.github/workflows/action.yml`
```
on: push
name: view
jobs:
  view:
    name: Get pods
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: run kubectl command
      id: kubectl_command
      uses: keijoraamat/kubectl_action@0.1.0
      env:
        kube_confg: ${{ secrets.KUBE_CONFIG }}
      with:
        args: kubectl get pods
```
