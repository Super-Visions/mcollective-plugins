
class mcollective_plugins::plugins (
	$manage_plugins = hiera('mco_manage_plugins'),
	$plugin_list = hiera_hash('mcollective_plugins', {} )
)
{
	if( $manage_plugins == 'true' )
	{
  	validate_hash($plugin_list)
  	create_resources( mcollective_plugins::plugin, $plugin_list )
	}
}

