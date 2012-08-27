
define mcollective_plugins::plugin (
	$type,
	$ensure = present,
	$ddl = 'false',
	$application = 'false',
	$server = hiera('mco_server'),
	$client = hiera('mco_client'),
	$plugin_base = hiera('mco_plugin_base'),
)
{
	
	if ($ddl == 'true' or $application == 'true') and $type != 'agent' {
		fail('DDLs and Applications only apply to Agent plugins')
	}

	#
	notice( "server: $server" )
	if( $server == 'true' )
	{
		file { "${plugin_base}/${type}/${name}.rb":
			ensure => $ensure,
			source => "puppet:///modules/mcollective_plugins/plugins/${type}/${name}.rb",
		}
	}
	
	notice( "client: $client" )
	# only install .ddl and application files on mco clients 
	if( $client == 'true' )
	{
		if( $ddl == 'true' )
		{
			file { "${plugin_base}/${type}/${name}.ddl":
				ensure => $ensure,
				source => "puppet:///modules/mcollective_plugins/plugins/${type}/${name}.ddl",
			}
		}
		if( $application == 'true' ) 
		{
			file { "${plugin_base}/application/${name}.rb":
				ensure => $ensure,
				source => "puppet:///modules/mcollective_plugins/plugins/application/${name}.rb",
			}
		}
	}
}
