class jenkins (
	$source='http://mirrors.jenkins-ci.org/war/latest/jenkins.war',
	$package='jenkins.war',){
	
	exec {'download-jenkins':
	command => "wget $source",
	cwd => "/$id",
	path => '/usr/bin'
	}
	
	file { '/root/apache-tomcat-8.0.33/webapps/jenkins.war':
		ensure => present,
		source => "/root/jenkins.war",
	}
} 
