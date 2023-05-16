# 
# The main file.
#

module "hello" {
    source = "./modules/hello"
    file_content = var.file_content
    file_name = "/tmp/hello.txt"
}