# 
# The main file.
# triggering workflow
#

terraform {
    cloud {
        organization = "sandor-juhasz"
        hostname="app.terraform.io"
        workspaces {
          name="github-terraform-test"
        }
    }
}

resource "local_file" "testfile" {
    filename = "/tmp/hello.txt"
    content = var.file_content
}
