opencpu Cookbook
===============
Installs and configures the opencpu project via previously offered PPA. Tested as working only on Ubuntu 14.04 

Now supports installation of the legacy pre-1.0 opencpu packages. In general, this can be completely ignored, but if you know you want these packages, please ensure that your OS is Ubuntu 12.04.

TODO: break this apart into individual component cookbook install method. 

Requirements
------------
### Platforms
- Ubuntu 14.04
- Ubuntu 12.04

### Dependencies
- apt

Attributes
----------
*  `default['opencpu']['release']` - The release of opencpu to install. one of `["stable", "legacy"]`, but in general leave as default: `stable`.

Usage
-----
#### opencpu::default
Sets up the system pre-requisites for opencpu per the ppa offered by core opencpu developer, Jeroen Ooms

#### opencpu::cache
Installs nginx as a reverse proxy/caching engine configured for apache/RApache/opencpu. Done again via the provided ppa.

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