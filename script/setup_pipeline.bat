@echo off
md data_pipeline_project
cd data_pipeline_project

echo import requests>scraper.py
echo from bs4 import BeautifulSoup>>scraper.py
echo import pandas as pd>>scraper.py
echo.>>scraper.py
echo def scrape_data(url):>>scraper.py
echo.>>scraper.py
echo response=requests.get(url)>>scraper.py
echo soup=BeautifulSoup(response.content,'html.parser')>>scraper.py
echo data=[]>>scraper.py
echo return pd.DataFrame(data)>>scraper.py
echo.>>scraper.py
echo if ^__name__ == "^__main__":>>scraper.py
echo url="https://coinmarketcap.com/">>scraper.py
echo scraped_data=scrape_data(url)>>scraper.py
echo scraped_data.to_csv('scraped_data.csv', index=False)>>scraper.py
echo echo "Data scraped and saved to scraped_data.csv">>scraper.py
echo.>>scraper.py

echo import pandas as pd>transform.py
echo.>>transform.py
echo def clean_data(file_path):>>transform.py
echo df=pd.read_csv(file_path)>>transform.py
echo return df>>transform.py
echo.>>transform.py
echo if ^__name__ == "^__main__":>>transform.py
echo transformed_data=clean_data('scraped_data.csv')>>transform.py
echo transformed_data.to_csv('transformed_data.csv', index=False)>>transform.py
echo echo "Data cleaned and saved to transformed_data.csv">>transform.py
echo.>>transform.py

echo import pandas as pd>load.py
echo from sqlalchemy import create_engine>>load.py
echo.>>load.py
echo def load_data_to_db(file_path, db_uri):>>load.py
echo df=pd.read_csv(file_path)>>load.py
echo engine=create_engine(db_uri)>>load.py
echo with engine.connect() as conn:>>load.py
echo df.to_sql('scraped_data', conn, if_exists='replace', index=False)>>load.py
echo echo "Data loaded into the database">>load.py
echo.>>load.py
echo if ^__name__ == "^__main__":>>load.py
echo db_uri="postgresql://username:password@localhost:5432/yourdatabase">>load.py
echo load_data_to_db('transformed_data.csv', db_uri)>>load.py
echo.>>load.py

echo from scraper import scrape_data>pipeline.py
echo from transform import clean_data>>pipeline.py
echo from load import load_data_to_db>>pipeline.py
echo.>>pipeline.py
echo def run_pipeline():>>pipeline.py
echo url="https://coinmarketcap.com/">>pipeline.py
echo scraped_data=scrape_data(url)>>pipeline.py
echo scraped_data.to_csv('scraped_data.csv', index=False)>>pipeline.py
echo.>>pipeline.py
echo transformed_data=clean_data('scraped_data.csv')>>pipeline.py
echo transformed_data.to_csv('transformed_data.csv', index=False)>>pipeline.py
echo.>>pipeline.py
echo db_uri="postgresql://username:password@localhost:5432/yourdatabase">>pipeline.py
echo load_data_to_db('transformed_data.csv', db_uri)>>pipeline.py
echo.>>pipeline.py
echo if ^__name__ == "^__main__":>>pipeline.py
echo run_pipeline()>>pipeline.py
echo.>>pipeline.py

echo requests>requirements.txt
echo beautifulsoup4>>requirements.txt
echo pandas>>requirements.txt
echo sqlalchemy>>requirements.txt
echo psycopg2-binary>>requirements.txt
echo.>>requirements.txt

echo # Data Pipeline Project>README.md
echo.>>README.md
echo This project is a data pipeline that extracts data from a website, transforms it, and loads it into a PostgreSQL database.>>README.md
echo.>>README.md
echo ## Project Structure>>README.md
echo.>>README.md
echo - \`scraper.py\`: Handles web scraping to extract data from the source.>>README.md
echo - \`transform.py\`: Contains logic to clean and transform the scraped data.>>README.md
echo - \`load.py\`: Loads the transformed data into a PostgreSQL database.>>README.md
echo - \`pipeline.py\`: Orchestrates the ETL process.>>README.md
echo - \`requirements.txt\`: Lists the required Python packages.>>README.md
echo - \`README.md\`: Project documentation.>>README.md
echo.>>README.md
echo ## How to Run>>README.md
echo.>>README.md
echo 1. **Install Dependencies**:>>README.md
echo \`\`\`bash>>README.md
echo pip install -r requirements.txt>>README.md
echo \`\`\`>>README.md
echo.>>README.md
echo 2. **Configure Database**: Update the database URI in \`load.py\` with your database credentials.>>README.md
echo.>>README.md
echo 3. **Run the Pipeline**:>>README.md
echo \`\`\`bash>>README.md
echo python pipeline.py>>README.md
echo \`\`\`>>README.md
echo.>>README.md
echo ## Requirements>>README.md
echo.>>README.md
echo - Python 3.x>>README.md
echo - PostgreSQL>>README.md
echo.>>README.md
echo ## Author>>README.md
echo.>>README.md
echo - **Your Name**: [Ayomide Fadeyi]>>README.md
echo.>>README.md
echo ## License>>README.md
echo.>>README.md
echo This project is licensed under the MIT License.>>README.md
echo.>>README.md

echo Data pipeline project structure created successfully!
