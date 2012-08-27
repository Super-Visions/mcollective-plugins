
class mcollective_plugins::config (
	$plugin_base = hiera('mco_plugin_base'),
	$plugin_subs = hiera('mco_plugin_subs'),
)
{
  validate_string($plugin_base)
	validate_array($plugin_subs)

  File{
		owner => '0',
		group => '0',
		mode  => '0644',
	}

	file{ $plugin_base:
		ensure => directory,
	}
	file{ $plugin_subs:
		ensure => directory,
	}

}

