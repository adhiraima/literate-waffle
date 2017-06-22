#!/usr/bin/env python

import requests
import time
import random

# main api url to fetch driver information on the basis of coordinates provided
url = 'http://localhost:3000/drivers'
params = {}
latitude = 38.898556
longitude = -77.037859

for i in range(1, 100, 1):
    params['latitude'] = latitude + (random.random() / 100)
    params['longitude'] = longitude + (random.random() / 100)
    start = time.time()
    r = requests.get(url, params)
    total = (time.time() - start) * 1000
    print 'Time taken: ' + str(total) + ' With status: ' + str(r.status_code)
    print r.content


