name             'rsc_ruby'
maintainer       'RightScale, Inc.'
maintainer_email 'cookbooks@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures ruby '
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "ruby_build"

recipe "rsc_ruby::default", "Install ruby"

attribute 'rsc_ruby/ruby/version',
  :display_name => 'Ruby Version',
  :description => 'The version of ruby to install. i.e 1.9.3-p545',
  :required => 'optional',
  :recipes => ['rsc_ruby::default']

attribute 'rsc_ruby/ruby/prefix_path',
  :display_name => 'Ruby install prefix path',
  :description => 'Where will ruby be installed.  default is /usr/local/ruby',
  :required => 'optional',
  :recipes => ['rsc_ruby::default']