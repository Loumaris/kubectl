# loumaris/kubectl

A small helper image to run `kubectl` inside a CI like gitlab-ci.

## usage

* encode your kubeconfig to a base64 string, e.g.
  ```shell
  cat ~/.kube/config | base64
  ```
* add the content to an env-variable called `KUBECONFIG_BASE64`
* run a `kubectl` command, e.g.
  ```shell
  docker run -e KUBECONFIG_BASE64='....' loumaris/kubectl get nodes
  ```

That's it ;-)

## gitlab-ci usage

* see the usage
* add the base64 string to your gitlab-ci configuration
* add the image to your `.gitlab-ci.yaml` (e.g. update nginx):
  ```yaml
  stages:
  - deploy

  deploy:
    stage: deploy
    script:
      - docker run -e "KUBECONFIG_BASE64=$KUBECONFIG_BASE64" loumaris/kubectl set image deployment/nginx-deployment nginx=nginx:1.16.1 --record
    only:
      - master
      - tags
  ```