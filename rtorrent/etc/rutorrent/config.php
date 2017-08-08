<?php
	date_default_timezone_set(getenv('TIMEZONE'));
	@define('HTTP_USER_AGENT', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0', true);
	@define('HTTP_TIME_OUT', 60, true);
	@define('HTTP_USE_GZIP', true, true);
	@define('PHP_USE_GZIP', false, true);
	@define('PHP_GZIP_LEVEL', 2, true);
	@define('RPC_TIME_OUT', 10, true);
	@define('LOG_RPC_CALLS', false, true);
	@define('LOG_RPC_FAULTS', true, true);

	$topDirectory = '/';
	$log_file = '/dev/stderr';
	$do_diagnostic = false;
	$saveUploadedTorrents = true;
	$overwriteUploadedTorrents = false;
	$forbidUserSettings = false;
	$canUseXSendFile = true;
	$tempDirectory = null;
	$schedule_rand = 10;

	$profilePath = getenv('RUTORRENT_DATA');
	$profileMask = 0770;

	$scgi_host = '127.0.0.1';
	$scgi_port = 5000;
	$XMLRPCMountPoint = '/RPC2';

	$localhosts = array(
		'127.0.0.1',
		'localhost',
	);

	$pathToExternals = array(
		'php'  => '/usr/bin/php',
		'curl' => '/usr/bin/curl',
		'gzip' => '/usr/bin/gzip',
		'id'   => '/usr/bin/id',
		'stat' => '/usr/bin/stat',
	);
