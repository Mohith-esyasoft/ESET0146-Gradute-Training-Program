#extract information from dataset named "data"
import pandas as pd
data = pd.read_csv('data.csv')
print(data.head())
print(data.describe())
print(data.info())
print(data.columns)
