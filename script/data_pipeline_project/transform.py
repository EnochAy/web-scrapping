import pandas as pd

def clean_data(file_path):
df=pd.read_csv(file_path)
return df

if __name__ == "^__main__":
transformed_data=clean_data('scraped_data.csv')
transformed_data.to_csv('transformed_data.csv', index=False)
echo "Data cleaned and saved to transformed_data.csv"

