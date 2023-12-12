#aqui é um bucket s3 também, mas com um site com pequeno index

provider "aws" {
  region = "us-west-1" # Update with your desired region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "guaidoh31-05" # Update with your desired bucket name
  acl    = "private"          # Set the bucket access control list (ACL) - private, public-read, or public-read-write


website {
		index_document = "index.html" #o index vai no mesmo diretório do script terraform
	}

}

resource "aws_s3_object" "index" {
	bucket = aws_s3_bucket.my_bucket.id
	key = "index.html" 
	source = "./index.html" #if in other directory, put the path
	content_type = "text/html"
}