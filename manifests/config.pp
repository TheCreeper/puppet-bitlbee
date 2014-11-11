# Class: bitlbee::config
#
# Class which configures the bitlbee service
class bitlbee::config {

	$config_ensure = $bitlbee::package_ensure ? {

		'absent' => 'absent',
		'purged' => 'absent',
		default => present,
	}

	$config_directory_ensure = $config_ensure ? {

		'absent' => 'absent',
		default => directory,
	}

	file { "${bitlbee::configdir}":

		ensure => $config_directory_ensure,
		purge => $bitlbee::config_purge,
		recurse => true,
		force => true,
		mode => '0755',
		owner => 'root',
		group => 'root',
	}->
	file { "${bitlbee::configdir}/bitlbee.conf":

		notify => Service[$bitlbee::service_name],

		ensure => $config_ensure,
		mode => '0640',
		owner => 'root',
		group => 'root',
		content => template('bitlbee/bitlbee.conf.erb'),
	}->
	file { "${bitlbee::configdir}/motd.txt":

		notify => Service[$bitlbee::service_name],

		ensure => $config_ensure,
		mode => '0644',
		owner => 'root',
		group => 'root',
		content => template('bitlbee/motd.txt.erb'),
	}
}
