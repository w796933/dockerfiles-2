<?php
function _grepAutodlCfg($option) {
	global $autodlCfg;
	return trim(`egrep -m1 '^\s*${option}\s*=' '${autodlCfg}' | cut -d= -f2-`);
}

$autodlCfg = '/data/.autodl/autodl.cfg';
$autodlPort = _grepAutodlCfg('gui-server-port');
$autodlPassword = _grepAutodlCfg('gui-server-password');
