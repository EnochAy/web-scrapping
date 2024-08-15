#!/bin/bash

# Create the project directory
mkdir -p data_pipeline_project

# Navigate into the project directory
cd data_pipeline_project

# Create the Python scripts and README.md file
touch scraper.py transform.py load.py pipeline.py requirements.txt README.md

# Populate `scraper.py` with a basic template
cat <<EOL > scraper.py
import requests
from bs4 import BeautifulSoup
import pandas as pd

def scrape_data(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.content, 'html.parser')
    data = []
    # Add your scraping logic here
    return pd.DataFrame(data)

if __name__ == "__main__":
    url = "http://example.com/data"
    scraped_data = scrape_data(url)
    scraped_data.to_csv('scraped_data.csv', index=False)
    print("Data scraped and saved to scraped_data.csv")
EOL

# Populate `transform.py` with a basic template
cat <<EOL > transform.py
import pandas as pd

def clean_data(file_path):
    df = pd.read_csv(file_path)
    # Add your transformation logic here
    return df

if __name__ == "__main__":
    transformed_data = clean_data('scraped_data.csv')
    transformed_data.to_csv('transformed_data.csv', index=False)
    print("Data cleaned and saved to transformed_data.csv")
EOL

# Populate `load.py` with a basic template
cat <<EOL > load.py
import pandas as pd
from sqlalchemy import create_engine

def load_data_to_db(file_path, db_uri):
    df = pd.read_csv(file_path)
    engine = create_engine(db_uri)
    with engine.connect() as conn:
        df.to_sql('scraped_data', conn, if_exists='replace', index=False)
        print("Data loaded into the database")

if __name__ == "__main__":
    db_uri = "postgresql://username:password@localhost:5432/yourdatabase"
    load_data_to_db('transformed_data.csv', db_uri)
EOL

# Populate `pipeline.py` with a basic template
cat <<EOL > pipeline.py
from scraper import scrape_data
from transform import clean_data
from load import load_data_to_db

def run_pipeline():
    url = "http://example.com/data"
    scraped_data = scrape_data(url)
    scraped_data.to_csv('scraped_data.csv', index=False)

    transformed_data = clean_data('scraped_data.csv')
    transformed_data.to_csv('transformed_data.csv', index=False)

    db_uri = "postgresql://username:password@localhost:5432/yourdatabase"
    load_data_to_db('transformed_data.csv', db_uri)

if __name__ == "__main__":
    run_pipeline()
EOL

# Populate `requirements.txt` with the necessary Python dependencies
cat <<EOL > requirements.txt
requests
beautifulsoup4
pandas
sqlalchemy
psycopg2-binary
EOL

# Populate `README.md` with a basic template
cat <<EOL > README.md
# Data Pipeline Project

This project is a data pipeline that extracts data from a website, transforms it, and loads it into a PostgreSQL database.

## Project Structure

- \`scraper.py\`: Handles web scraping to extract data from the source.
- \`transform.py\`: Contains logic to clean and transform the scraped data.
- \`load.py\`: Loads the transformed data into a PostgreSQL database.
- \`pipeline.py\`: Orchestrates the ETL process.
- \`requirements.txt\`: Lists the required Python packages.
- \`README.md\`: Project documentation.

## How to Run

1. **Install Dependencies**:
   \`\`\`bash
   pip install -r requirements.txt
   \`\`\`

2. **Configure Database**: Update the database URI in \`load.py\` with your database credentials.

3. **Run the Pipeline**:
   \`\`\`bash
   python pipeline.py
   \`\`\`

## Requirements

- Python 3.x
- PostgreSQL or another database of your choice

## Author

- **Your Name**: [Your Contact Information]

## License

This project is licensed under the MIT License.
EOL

# Display a message indicating setup is complete
echo "Data pipeline project structure created successfully!"
