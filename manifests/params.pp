# Class: freeradius::params
#
# This class defines default parameters used by the main module class freeradius
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to freeradius class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class freeradius::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'freeradius',
  }

  $service = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'freeradius',
    default                   => 'radiusd',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'freeradius',
    default                   => 'radiusd',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'freerad',
    default                   => 'radiusd',
  }

  $config_dir = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/freeradius',
    default                   => '/etc/raddb',
  }

  $config_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/freeradius/radiusd.conf',
    default                   => '/etc/raddb/radiusd.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '0640',
    default                   => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'freerad',
    default                   => 'radiusd',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/freeradius',
    default                   => '/etc/sysconfig/radiusd',
  }

  $pid_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/run/freeradius/freeradius.pid',
    default                   => '/var/run/radiusd/radiusd.pid',
  }

  $data_dir = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/lib/freeradius',
    default                   => '/var/lib/radiusd',
  }

  $log_dir = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/log/freeradius',
    default                   => '/var/log/radius',
  }

  $log_file = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/log/freeradius/radius.log',
    default                   => '/var/log/radius/radius.log',
  }

  $port = '1812'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
