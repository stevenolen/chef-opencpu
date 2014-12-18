ohmage Cookbook
===============
Installs and configures the ohmage project and related clients.  Information about ohmage can be found at http://www.ohmage.org. This is an early version of this cookbook, done by someone quite new to chef -- please feel free to offer comments/suggestions. 

ohmage has been mainly tested and used in a small single-system environment, so it is recommended to create an `ohmage-server` role that includes (in order): `ohmage::mysql`, `ohmage::nginx` and `ohmage::default` to ensure a fully-running ohmage setup.  

Please note that as of the time of writing this, the `mysql_chef-gem` package and `database` package were avoided due to some odd behavior on Ubuntu 14.04. 

Requirements
------------
### Platforms
- Ubuntu

### Dependencies
- java
- tomcat
- mysql
- git
- nginx
- ant (if compiling the server)
- build-essential (if compiling the server)

Attributes
----------
*  `default['ohmage']['version']` - The version of ohmage to install, default `2.16`
*  `default['ohmage']['user_setup']` - Whether or not to install the user_setup version of ohmage, default `false`
*  `default['ohmage']['install_method']` - Whether to download the pre-compiled server war, or build the source, default `download`
*  `default['ohmage']['data_dir']` - Location of the ohmage userdata files, default `/var/lib/ohmage`
*  `default['ohmage']['log_dir']` - Location of the ohmage log files, default `/var/log/ohmage`
*  `default['ohmage']['navbar']` - Whether to deploy the iframe-based navbar for frontend clients, default `true`
*  `default['ohmage']['log_level']` - Log level for ohmage logging, default `DEBUG`
*  `default['ohmage']['db']['host']` - Hostname for the mysql server, default `localhost`
*  `default['ohmage']['db']['port']` - Port number for the mysql server, `3306`
*  `default['ohmage']['db']['name']` - Database name for the mysql server, default `ohmage`
*  `default['ohmage']['db']['user']` - Username for the mysql database, default `ohmage`
*  `default['ohmage']['db']['password']` - Password for the mysql database, default `pleasechangeme`

Usage
-----
#### ohmage::default
Sets up the system pre-requisites for ohmage (java, tomcat) and installs the ohmage server war file (either via http download or `git clone` and `ant clean dist` compilation, set via `default['ohmage']['install_method']` attribute). Note: ohmage will fail to start without also providing attributes for `default['ohmage']['db']` and/or including the `ohmage::mysql` recipe. in version `0.1.0` there may be some bugs when running mysql somewhere other than `localhost`. 

#### ohmage::nginx
Installs nginx for use as a reverse proxy to ohmage and a static web-content server for the ohmage frontend clients.  As of version `0.1.0` this does not handle SSL communication. If `default['ohmage']['navbar']` is set to `true` (the default), this recipe will also install the ohmage navbar at the nginx root directory (by default is `/var/www/`).

#### ohmage::frontends
Installs the open source ohmage frontends from pre-compiled packages (those that need to be built/compiled) and from source (using `git clone`). These will be installed to `/var/www/webapps` by default.

License and Authors
-------------------
- Author: Steve Nolen (<technolengy@gmail.com>)

```text
Copyright:: 2014.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```