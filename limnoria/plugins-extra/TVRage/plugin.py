###
# Copyright (c) 2013, dan (https://github.com/ddan39/Supybot-TvRage)
# All rights reserved.
#
###

import supybot.callbacks as callbacks
from supybot.commands import *

import urllib2
from urllib import urlencode
import datetime
from dateutil.parser import parse as parse_date
from pytz import UTC

user_agent = 'Mozilla/5.0; Windows NT 6.1; WOW64; Trident/7.0; rv:11.0; like Gecko'

class TVRage(callbacks.Plugin):
    """Get information about TV shows and schedules"""
    threaded = True

    def tvrage(self, irc, msg, args, opts, text):
        """[-n] [-l] [-e] <TV show name>
        get information about a TV show and when it airs, -n for next episode, -l for last episode, -e for extra info"""

        shownext = False
        showlast = False
        showextra = False
        for opt, val in opts:
            if opt == 'n' or opt == 'next':
                shownext = True
            if opt == 'l' or opt == 'last':
                showlast = True
            if opt == 'e' or opt == 'extra':
                showextra = True

        try:
            u = 'http://services.tvrage.com/tools/quickinfo.php?%s' % urlencode({'show': text})
            r = urllib2.Request(u, headers={'User-Agent': user_agent})
            p = urllib2.urlopen(r, timeout=20).read()
        except Exception as e:
            irc.error(str(e))
            return

        if p.startswith('No Show Results Were Found For'):
            irc.error('Could not find the TV show.')
            return

        showinfo = {}
        for rline in p[5:].splitlines():
            a, b = rline.split('@', 1)
            showinfo[a] = b

        out = []
        out.append('\x02%(Show Name)s:\x02 %(Status)s' % showinfo)
        if 'Airtime' in showinfo:
            out.append('%(Airtime)s' % showinfo)
        if 'Network' in showinfo:
            out.append('on %(Network)s' % showinfo)
        irc.reply(', '.join(out), prefixNick=False)

        if shownext:
            if 'Next Episode' in showinfo:
                epnumber, epname, epdate = showinfo['Next Episode'].split('^')
                if 'RFC3339' in showinfo:
                    delta_next = parse_date(showinfo['RFC3339']).astimezone(UTC) - datetime.datetime.now(UTC)
                    if delta_next.days > 1:
                        from_now = ', %s days from now' % delta_next.days
                    else:
                        td = delta_next
                        hours_from_now = (((td.microseconds + (td.seconds + td.days * 24 * 3600) * 10**6) / 10**6) / 60.0 / 60.0)
                        if hours_from_now < 0:
                            from_now = ', %.2f hours ago' % (hours_from_now * -1)
                        else:
                            from_now = ', %.2f hours from now' % hours_from_now
                else:
                    from_now = ''

                irc.reply('\x02Next:\x02 %s - %s, airs on %s%s' % (epnumber, epname, epdate, from_now), prefixNick=False)
            else:
                irc.reply('\x02Next:\x02 No upcoming episodes found.', prefixNick=False)

        if showlast:
            if 'Latest Episode' in showinfo:
                epnumber, epname, epdate = showinfo['Latest Episode'].split('^')
                irc.reply('\x02Last:\x02 %s - %s, aired on %s' % (epnumber, epname, epdate), prefixNick=False)
            else:
                irc.reply('\x02Last:\x02 No episodes have aired.', prefixNick=False)

        if showextra:
            out = []
            if 'Genres' in showinfo:
                genres = showinfo['Genres'].strip()
                if genres[:2] == '| ': genres = genres[2:]

                out.append('\x02Genres:\x02 %s' % genres)
            if 'Runtime' in showinfo:
                out.append('\x02Runtime:\x02 %(Runtime)s' % showinfo)
            if 'Premiered' in showinfo:
                out.append('\x02Premiered:\x02 %(Premiered)s' % showinfo)
            if 'Classification' in showinfo:
                out.append('\x02Classification:\x02 %(Classification)s' % showinfo)
            if out:
                irc.reply(', '.join(out), prefixNick=False)

    tvrage = wrap(tvrage, [getopts({'n': '', 'next': '', 'l': '', 'last': '', 'e': '', 'extra': ''}), 'text'])

    def tvschedule(self, irc, msg, args, text):
        """<day|tonight|tomorrow>
        get TV schedule for a given day"""

        now_est = datetime.datetime.now() - datetime.timedelta(hours=8)
        try:
            u = 'http://services.tvrage.com/tools/quickschedule.php'
            r = urllib2.Request(u, headers={'Date': now_est.strftime('%a, %d %b %Y %H:%M:%S GMT'), 'User-Agent': user_agent})
            p = urllib2.urlopen(r, timeout=20).read()
        except Exception as e:
            irc.error(str(e))
            return

        days_dict = {}
        days = p.split('\n\n\n')
        for x in days:
            x = x.split('\n', 1)
            for a in ('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'):
                if a in x[0]: 
                    days_dict[a] = x

        text = text.lower()
        if text == 'tomorrow': sched = days_dict[(now_est+datetime.timedelta(days=1)).strftime('%A')]
        elif text in ('today', 'tonight'): sched = days_dict[now_est.strftime('%A')]
        elif text in ('sun', 'sunday'): sched = days_dict['Sunday']
        elif text in ('mon', 'monday'): sched = days_dict['Monday']
        elif text in ('tue', 'tuesday'): sched = days_dict['Tuesday']
        elif text in ('wed', 'wednesday'): sched = days_dict['Wednesday']
        elif text in ('thu', 'thursday'): sched = days_dict['Thursday']
        elif text in ('fri', 'friday'): sched = days_dict['Friday']
        elif text in ('sat', 'saturday'): sched = days_dict['Saturday']
        else: 
            irc.error('What day is that?')
            return

        day, sched = sched
        irc.reply('Messaging you with the schedule for %s.' % day[5:-6])
        sched = sched.split('[TIME]')[1:]
        for x in sched:
            shows = []
            x = x.split('\n', 1)
            time = str(x[0][:-7])
            for y in x[1].split('[/SHOW]\n[SHOW]'):
                y = y.replace('[SHOW]', '').replace('[/SHOW]', '').strip()
                shows.append(y.split('^')[1])
            irc.reply('\x02%s:\x02 %s' % (time, ', '.join(shows)), private=True, prefixNick=False)

    tvschedule = wrap(tvschedule, ['text'])

Class = TVRage


# vim:set shiftwidth=4 softtabstop=4 expandtab:
