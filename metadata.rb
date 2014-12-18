name             'opencpu'
maintainer       'Steve Nolen'
maintainer_email 'technolengy@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures opencpu'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt'

supports 'ubuntu', '= 14.04'

recipe 'opencpu::default', 'Install and configures opencpu server from jeroenooms ppa'
recipe 'opencpu::cache', 'Installs the provided caching server for opencpu (uses nginx)'