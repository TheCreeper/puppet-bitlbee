# Class: bitlbee::config
#
# Class which configures the bitlbee service
class bitlbee::config {

	file { "${bitlbee::configdir}/bitlbee.conf":

		notify => Service[$bitlbee::service_name],

		ensure => file,
		mode => '0640',
		owner => 'root',
		group => 'root',
		content => template('bitlbee/bitlbee.conf.erb'),
	}->
	file { "${bitlbee::configdir}/motd.txt":

		notify => Service[$bitlbee::service_name],

		ensure => file,
		mode => '0644',
		owner => 'root',
		group => 'root',
		content => template('bitlbee/motd.txt.erb'),
	}
}
