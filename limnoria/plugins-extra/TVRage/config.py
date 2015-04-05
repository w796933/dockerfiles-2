###
# Copyright (c) 2012, dan
# All rights reserved.
#
#
###

import supybot.conf as conf
import supybot.registry as registry

def configure(advanced):
    from supybot.questions import expect, anything, something, yn
    conf.registerPlugin('TVRage', True)


TvRage = conf.registerPlugin('TVRage')


# vim:set shiftwidth=4 tabstop=4 expandtab textwidth=79:
