class jdk (
	$source='http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-64.tar.gz',
	$package='jdk-8u91-linux-64.tar.gz',){

	exec {'download-jdk':
	command => "wget $source",
	cwd => "/$id",
	path => '/usr/bin',
	}
	exec { 'extract-jdk':
	command => "tar -xvf $package",
	cwd => "/$id",
	path => '/root',
	}	
}
	
