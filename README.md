# Puppet module: freeradius

## DEPRECATION NOTICE
This module is no more actively maintained and will hardly be updated.

Please find an alternative module from other authors or consider [Tiny Puppet](https://github.com/example42/puppet-tp) as replacement.

If you want to maintain this module, contact [Alessandro Franceschi](https://github.com/alvagante)


This is a Puppet module for freeradius based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-freeradius

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.

## USAGE - Basic management

* Install freeradius with default settings

        class { 'freeradius': }

* Install a specific version of freeradius package

        class { 'freeradius':
          version => '1.0.1',
        }

* Disable freeradius service.

        class { 'freeradius':
          disable => true
        }

* Remove freeradius package

        class { 'freeradius':
          absent => true
        }

* Enable auditing without without making changes on existing freeradius configuration files

        class { 'freeradius':
          audit_only => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'freeradius':
          source => [ "puppet:///modules/example42/freeradius/freeradius.conf-${hostname}" , "puppet:///modules/example42/freeradius/freeradius.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'freeradius':
          source_dir       => 'puppet:///modules/example42/freeradius/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'freeradius':
          template => 'example42/freeradius/freeradius.conf.erb',
        }

* Automatically include a custom subclass

        class { 'freeradius':
          my_class => 'example42::my_freeradius',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'freeradius':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'freeradius':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'freeradius':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'freeradius':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


[![Build Status](https://travis-ci.org/example42/puppet-freeradius.png?branch=master)](https://travis-ci.org/example42/puppet-freeradius)
