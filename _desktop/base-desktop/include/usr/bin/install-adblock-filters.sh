#!/bin/sh
mkdir -p /usr/share/adblock/
pushd /usr/share/adblock/
curl -OL https://easylist-downloads.adblockplus.org/easylist.txt
curl -OL https://easylist-downloads.adblockplus.org/easyprivacy.txt
curl -OL https://easylist-downloads.adblockplus.org/fanboy-social.txt
curl -OL https://easylist-downloads.adblockplus.org/antiadblockfilters.txt
curl -OL https://raw.githubusercontent.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt
curl -OL https://raw.githubusercontent.com/liamja/Prebake/master/obtrusive.txt
curl -OL https://secure.fanboy.co.nz/fanboy-antifacebook.txt
curl -OL https://secure.fanboy.co.nz/enhancedstats.txt
curl -OL https://s3.amazonaws.com/lists.disconnect.me/simple_malvertising.txt
popd
