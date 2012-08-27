
class mcollective_plugins
{
	anchor { 'mcollective_plugins::start': }->
	class { 'mcollective_plugins::config': }->
	class { 'mcollective_plugins::plugins': }->
	anchor { 'mcollective_plugins::end': }
}

