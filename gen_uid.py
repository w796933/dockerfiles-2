#!/usr/bin/env python3
from hashlib import sha1

uid_min = 10000
uid_max = 60000

name = input('Username: ').encode('utf-8')
uid_ = int(sha1(name).hexdigest(), 16) % (uid_max - uid_min) + uid_min

print('UID: %d' % uid_)
