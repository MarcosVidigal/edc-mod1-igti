import boto3
import pandas as pd

# Criar um cliente para interagir com o AWS S3
s3_client = boto3.client('s3')

s3_client.download_file("datalake-marcosvidigalbezerra-470239339460",
                         "raw-data/MICRODADOS_ENEM_2020.csv",
                         "MICRODADOS_ENEM_2020.csv")

df = pd.read_csv("MICRODADOS_ENEM_2020.csv")
print(df)