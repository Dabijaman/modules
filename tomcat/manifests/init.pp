class tomcat(
	$source='http://apache.volia.net/tomcat/tomcat-8/v8.0.33/bin/apache-tomcat-8.0.33.tar.gz',
	$package='apache-tomcat-8.0.33.tar.gz',
	$catalina_path='/root/apache-tomcat-8.0.33',){

	exec {'download-apache-tomcat-8.0.33.tar.gz':
	command => "wget $source",
	cwd => "/$id",
	path => '/usr/bin',
	}
	exec {'extract-apache-tomcat-8.0.33.tar.gz':
	command => "tar -xvf $package",
	cwd => "/$id",
	path => '/bin',
	require => Exec['download-apache-tomcat-8.0.33.tar.gz']
	}
	file {"/etc/profile.d/catalina.sh":
	content => "export CATALINA_HOME=/root/apache-tomcat-8.0.33",
	mode => 755,
	}	
}


