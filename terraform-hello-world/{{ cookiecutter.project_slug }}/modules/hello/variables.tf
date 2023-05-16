variable "file_content" {
    default = "Hello, World!"
    type = string
    description = "The content which will appear in the Hello file."
}

variable "file_name" {
    default = "/tmp/hello.txt"
    type = string
    description = "The Hello file."
}