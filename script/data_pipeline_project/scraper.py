import requests
from bs4 import BeautifulSoup
import pandas as pd

def scrape_data(url):

response=requests.get(url)
soup=BeautifulSoup(response.content,'html.parser')
data=[]
return pd.DataFrame(data)

if __name__ == "^__main__":
url="http://example.com/data"
scraped_data=scrape_data(url)
scraped_data.to_csv('scraped_data.csv', index=False)
echo "Data scraped and saved to scraped_data.csv"

