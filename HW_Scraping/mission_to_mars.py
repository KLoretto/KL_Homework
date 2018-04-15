
# coding: utf-8

# In[1]:


# Dependencies
from bs4 import BeautifulSoup
import requests
import pymongo
from splinter import Browser
import tweepy
import time
import pandas as pd

# Initialize PyMongo to work with MongoDBs
conn = 'mongodb://localhost:27017'
client = pymongo.MongoClient(conn)

# URL of page to be scraped
url = 'https://mars.nasa.gov/news/'


# Retrieve page with the requests module
html = requests.get(url)
# Create BeautifulSoup object; parse with html
soup = BeautifulSoup(html.text, 'html.parser')


# In[2]:


#confirm link
soup.title.text


# In[26]:


#Collect the latest News Title and Paragraph
news_holder = soup.find('li', class_='slide')
news_title = soup.find('div', class_='content_title').text
news_p = soup.find('div', class_='rollover_description_inner').text
print(news_title)
print(news_p)


# In[111]:


# JPL URL of page to be scraped
url_jpl = 'https://www.jpl.nasa.gov/spaceimages/'


# Retrieve page with the requests module
html = requests.get(url_jpl)
# Create BeautifulSoup object; parse with html
soup2 = BeautifulSoup(html.text, 'html.parser')


# In[112]:


soup2.title.text


# In[124]:


#Collect the featured image on JPL page and print full addresss
featured_img_url = soup2.find('img', class_='thumb')
print(url_jpl + featured_img_url['src'])


# In[130]:


# Twitter URL of page to be scraped
url_tw = 'https://twitter.com/marswxreport?lang=en'


# Retrieve page with the requests module
html = requests.get(url_tw)
# Create BeautifulSoup object; parse with html
soup3 = BeautifulSoup(html.text, 'html.parser')


# In[132]:


soup3.title.text


# In[131]:


mars_weather = soup3.find('p','TweetTextSize TweetTextSize--normal js-tweet-text tweet-text').text
print(mars_weather)


# In[5]:


#Pandas was loaded in 1st step
#assign variable to website
url_fact = 'https://space-facts.com/mars/'


# In[10]:


#Create Table
tables = pd.read_html(url_fact)
tables[0]


# In[7]:


#Check table type
type(tables)


# In[12]:


#Create Dataframce from table
df = tables[0]
df.columns = ['Item', 'Fact']
df


# In[13]:


#Convert Data to HTML 
html_table = df.to_html()
html_table


# In[42]:


# USGS URL of page to be scraped
url_USGS = 'https://astrogeology.usgs.gov/search/results?q=hemisphere+enhanced&k1=target&v1=Mars'


# Retrieve page with the requests module
html = requests.get(url_USGS)
# Create BeautifulSoup object; parse with html
soup3 = BeautifulSoup(html.text, 'html.parser')


# In[43]:


soup3.title.text


# In[97]:


#Retrieve Data - test out signle pull of data
img_title = soup3.find('div', class_='description').text
Img = soup3.find('div', class_='item')
img_url = Img.find('a', class_='itemLink product-item')
print(img_title)
print(url_USGS + img_url['href'])


# In[135]:


#Retrieve Data - for all and append to disctionary
USGS = []
results = soup3.find_all('div', class_='item')

for result in results:
    img_title = result.find('div', class_='description').text
    img_url = result.find('a', class_='itemLink product-item')
    
    print(img_title)
    print(url_USGS + img_url['href'])
    full = (url_USGS + img_url['href'])
    
    
    # Append to dictionary
    hemisphere_image_urls = {
        'title': img_title,
        'img_url':full,
        }
    USGS.append(hemisphere_image_urls)
    
 


# In[136]:


print(USGS)

