from scraper import scrape_data
from transform import clean_data
from load import load_data_to_db

def run_pipeline():
url="http://example.com/data"
scraped_data=scrape_data(url)
scraped_data.to_csv('scraped_data.csv', index=False)

transformed_data=clean_data('scraped_data.csv')
transformed_data.to_csv('transformed_data.csv', index=False)

db_uri="postgresql://username:password@localhost:5432/yourdatabase"
load_data_to_db('transformed_data.csv', db_uri)

if __name__ == "^__main__":
run_pipeline()

