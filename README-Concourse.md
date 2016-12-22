# chaos-lemur-pipeline
---

This code will deploy the Chaos Lemur stress testing tools into the CloudFoundry environment.

## Prerequisites
---

  - GIT
  - Concourse

## How to use this pipeline
---

Within these instructions, we will assume that your CloudFoundry instance is 10.11.12.13, please adjust this to your actual CF instance IP.

  1. Checkout pipeline code from GIT

  ```bash
  $ git clone git@gitlab.vmware.com:gitlab-user/chaos-lemur-pipeline
  ```

  2. Change directory into the project's 'ci' folder

  ```bash
  $ cd chaos-lemur-pipeline/ci
  ```

  3. Clone a location template into a file with settings for this deployment.  Then use your favorite editor to adjust the locations and passwords appropriate for this deployment

  ```bash
  $ cp locations/{loc.template,mylocation.yml}
  $ sed -i 's/my.pcf-deployment.com/10.11.12.13/' mylocation.yml
  $ sed -i 's/my-pcf-admin-name/admin/' mylocation.yml
  $ sed -i 's/my-pcf-password/admin/' mylocation.yml
  $ sed -i 's/my-pcf-organization/pcf-org/' mylocation.yml
  $ sed -i 's/my-pcf-space/pcf-space/' mylocation.yml
  ```

  4. Log into Concourse Instance

  ```bash
  $ cf fly \
    - t cf1 \
    login \
    -c https://10.11.12.13:8080
  ```

  5. Upload the pipeline to Concourse

  ```bash
  $ fly \
     -t cf1 \
     set-pipeline \
     -c chaos-lemur-pipeline.yml \
     -p Chaos_Lemur \
     -l locations/mylocation.yml
  ```

  6. Unpause pipeline to start execution

  ```bash
  $ fly \
     -t cf1
     unpause-pipeline
     -p Chaos_Lemur  
  ```
