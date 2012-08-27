
class mcollective_plugins::data 
{
	$mco_manage_plugins = 'true'
	$mco_server = 'true'
	$mco_client = 'false'

  
  case $::operatingsystem 
	{
		CentOS, RedHat, Fedora: {
			$mco_libdir = '/usr/libexec/mcollective'

		}
		Ubuntu, Debian: {
			$mco_libdir = '/usr/share/mcollective/plugins'

		}
		Solaris: {
			$mco_libdir = '/opt/something'
		}
		default: {
      fail("Unsupported OS: $::operatingsystem")
		}
	}

	$mco_plugin_base = "${mco_libdir}/mcollective"

	$mco_plugin_subs = [
		"${mco_plugin_base}/agent",  
		"${mco_plugin_base}/application",  
		"${mco_plugin_base}/audit",  
		"${mco_plugin_base}/connector",  
		"${mco_plugin_base}/facts",  
		"${mco_plugin_base}/registration",  
		"${mco_plugin_base}/security",
		"${mco_plugin_base}/util",
	]
}

