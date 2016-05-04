class maven(
	$source='http://apache.volia.net/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz',
	$package='apache-maven-3.3.9-bin.tar.gz',){
	
	exec {'download-apache-maven':
	command => "wget $source",
	cwd => "/$id",
	path => '/usr/bin',
	}

	exec { 'exctract-maven':
	command => "tar -xvf $package",
	cwd => "/$id",
	path => '/bin',
	require => Exec['download-apache-maven']
	}
	
	file { "/etc/profile.d/maven_variables.sh":
	content => "export M2_HOME=/root/apache-maven-3.3.9
		export PATH=\$PATH:\$M2_HOME/bin",
	mode => 755,
	}		
}

