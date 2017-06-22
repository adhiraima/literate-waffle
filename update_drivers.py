#!/usr/bin/env python

import requests
import random
import time
import string



# main api url
base_url = 'http://localhost:3000/drivers/ID/location'

payload = {}
latitude = 38.898556
longitude = -77.037859

random.seed(1)
averageTime = 0;

for i in range(1, 50000, 1):
    payload['latitude'] = latitude + ( random.random() / 100 )
    payload['longitude'] = longitude + ( random.random() / 100 )
    url = string.replace(base_url, 'ID', str(i))
    start = time.time()
    r = requests.put(url, json=payload)
    total = (time.time() - start) * 1000
    if i == 0:
        averageTime = total
    else:
        averageTime = (averageTime + total)/2
    print 'Request Executed in: ' + str(total) + ' With status: ' + str(r.status_code) + ' With average running time: ' + str(averageTime)


