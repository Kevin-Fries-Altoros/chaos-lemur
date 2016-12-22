# chaos-lemur-pipeline
---

This Concourse pipeline will deploy the Chaos Lemur stress testing tool into Cloud Foundry.

## Prerequisites
---

  - Git
  - Concourse
  - Cloud Foundry

## How to use this pipeline
---

Within these instructions, we will assume that your Cloud Foundry instance is 10.11.12.13, please adjust this to your actual CF instance IP.

  1. Checkout pipeline code from Git

  ```bash
  $ git clone git@gitlab.vmware.com:gitlab-user/chaos-lemur
  ```

  2. Change directory into the project's 'ci' folder

  ```bash
  $ cd chaos-lemur/ci
  ```

  3. Clone a location template into a file with settings for this deployment.  Then use your favorite editor to adjust the locations and passwords appropriate for this deployment

  ```bash
  $ cp locations/loc.template locations/mylocation.yml
  $ sed -i 's/my.pcf-deployment.com/10.11.12.13/' locations/mylocation.yml
  $ sed -i 's/my-pcf-admin-name/admin/' locations/mylocation.yml
  $ sed -i 's/my-pcf-password/admin/' locations/mylocation.yml
  $ sed -i 's/my-pcf-organization/pcf-org/' locations/mylocation.yml
  $ sed -i 's/my-pcf-space/pcf-space/' locations/mylocation.yml
  ```

  4. Log into Concourse Instance

  ```bash
  $ cf fly - t cf1 login -c https://10.11.12.13:8080
  ```

  5. Upload the pipeline to Concourse

  ```bash
  $ fly -t cf1 set-pipeline -c chaos-lemur-pipeline.yml -p deploy-chaos-lemur -l locations/mylocation.yml
  ```

  6. Unpause pipeline

  ```bash
  $ fly -t cf1 unpause-pipeline -p deploy-chaos-lemur  
  ```

  7. Trigger the deployment job and observe the output.

  ```bash
  $ fly -t cf1 trigger-job -j deploy-pcf/deploy -w
  ```
