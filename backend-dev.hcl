bucket         = "terraform-backend-appweb-tfstate-rscopim"
key            = "appweb/dev/terraform.tfstate"
region         = "us-west-2"
# dynamodb_table = "terraform-appweb-terraform-lock"
encrypt        = true
use_lockfile = true