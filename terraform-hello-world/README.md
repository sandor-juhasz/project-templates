# Terraform Hello World template

This template was created based on Terraform configuration development best practices.

## Conventions, Best practices

- Project layout
  - Root module layout
    - Variable declarations are stored in the `/variables.tf` file.
    - Outputs are stored in the `/outputs.tf` file.
    - Each module has a `/main.tf` file which contains the most important resources
      and module declarations. If it makes sense, the `/main.tf` can be split into
      multiple files to group related resources.
  - Examples
    - Demonstration examples of the module are stored under the `/examples/<example-name>` 
      subdirectory. The examples are executable from this directory.

