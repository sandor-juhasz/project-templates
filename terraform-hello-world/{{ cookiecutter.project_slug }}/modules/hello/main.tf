resource "local_file" "testfile" {
    filename = var.file_name
    content = var.file_content
}