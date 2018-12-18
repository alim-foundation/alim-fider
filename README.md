**Follow the instructions from the below link and setup container-config-framework.**

https://github.com/shah/container-config-framework

**Clone this repository:**

`git clone https://github.com/alim-foundation/alim-fider.git /opt/alim-fider`

**Rename the template files to original file:**

`cd /opt/alim-fider/`

`mv postgres.secrets.ccf-tmpl-conf.jsonnet postgres.secrets.ccf-conf.jsonnet`
 
 `mv fider.ccf-tmpl-conf.jsonet fider.ccf-conf.jsonet`

**Edit the configuration files with actual values: **

 `vim postgres.secrets.ccf-conf.jsonnet`

 `vim fider.ccf-conf.jsonet`

  JWT_SECRET: You can generate a strong secret at https://randomkeygen.com/

**Create a docker network:**

`docker network create appliance`
 
**Start the CCF container: **

`sudo ccfmake start`

Now the fider application will be up and running at *http://ip-address:9000*
