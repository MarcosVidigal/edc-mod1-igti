# HCL - Hashicorp Configuration Language
# Linguagem declarativa para gerenciamento de configurações

provider "aws" {
  region = var.my_region
}

resource "aws_s3_bucket" "datalake" {
  # Parametros de configuração do recurso escolhido
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_ty.py"
  acl    = "private"
  source = "../infrastructure/job_spark.py"
  etag   = filemd5("../infrastructure/job_spark.py")
}


