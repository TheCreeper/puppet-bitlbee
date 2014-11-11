# Class: bitlbee
#
# Initialization class for the bitlbee service
class bitlbee (

	$package_ensure = latest,
	$package_name = 'bitlbee',

	$service_manage = true,
	$service_enable = true,
	$service_ensure = running,
	$service_name = 'bitlbee',

	$config_purge = true,
	$configdir = '/etc/bitlbee',

	$runmode = undef,
	$user = 'bitlbee',
	$daemoninterface = undef,
	$daemonport = undef,
	$clientinterface = undef,
	$authmode = undef,
	$authpassword = undef,
	$operpassword = undef,
	$hostname = $fqdn,
	$motdfile = '/etc/bitlbee/motd.txt',
	$pinginterval = undef,
	$pingtimeout = undef,
	$proxy = undef,
	$protocols = undef,
	$ssl = false,
	$cafile = '/etc/ssl/certs/ca-certificates.crt',
	$private = undef,
) {

	validate_string($package_ensure)
	validate_string($package_name)

	validate_bool($service_manage)
	validate_bool($service_enable)
	validate_string($service_ensure)
	validate_string($service_name)

	validate_bool($config_purge)
	validate_absolute_path($configdir)

	validate_string($runmode)
	validate_string($user)
	validate_string($daemoninterface)
	validate_string($clientinterface)
	validate_string($authmode)
	validate_string($authpassword)
	validate_string($operpassword)
	validate_string($hostname)
	validate_absolute_path($motdfile)
	validate_string($pinginterval)
	validate_string($pingtimeout)
	validate_string($proxy)
	validate_string($protocols)
	validate_bool($ssl)
	validate_absolute_path($cafile)
	validate_string($private)

	class{ 'bitlbee::install': }->
	class{ 'bitlbee::config': }->
	class{ 'bitlbee::service': }
}