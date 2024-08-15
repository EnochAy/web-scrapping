import pandas as pd
from sqlalchemy import create_engine

def load_data_to_db(file_path, db_uri):
df=pd.read_csv(file_path)
engine=create_engine(db_uri)
with engine.connect() as conn:
df.to_sql('scraped_data', conn, if_exists='replace', index=False)
echo "Data loaded into the database"

if __name__ == "^__main__":
db_uri="postgresql://username:password@localhost:5432/yourdatabase"
load_data_to_db('transformed_data.csv', db_uri)

