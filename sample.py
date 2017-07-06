
# coding: utf-8

# In[1]:

import requests
urls = ["http://www.alexa.com/siteinfo/sephora.com", "http://www.alexa.com/siteinfo/sephora.com","http://www.alexa.com/siteinfo/sephora.com","http://www.alexa.com/siteinfo/sephora.com"
      "http://www.alexa.com/siteinfo/sephora.com", "http://www.alexa.com/siteinfo/sephora.com", "http://www.alexa.com/siteinfo/sephora.com", "http://www.alexa.com/siteinfo/sephora.com"
       ,"http://www.alexa.com/siteinfo/sephora.com", "http://www.alexa.com/siteinfo/sephora.com", "http://www.alexa.com/siteinfo/sephora.com", "http://www.alexa.com/siteinfo/sephora.com"
       "http://www.alexa.com/siteinfo/sephora.com", "http://www.alexa.com/siteinfo/sephora.com"]
response = [0]*14
i = 0
for url in urls:
    response[i] = requests.get(url)
    i = i +1
    print i


# In[ ]:



