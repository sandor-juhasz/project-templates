# Hello, World! Terraform project with GitHub integration

This project demonstrates the integration of HCP Terraform with GitHub Actions.

## Setup 
1. Create a workspace in HCP Terraform.
   The workspace **must not** be configured to use Version control workflow.

2. Have a user in HCP Terraform which can at least run plans for this workspace.
   GitHub Actions will interact with HCP terraform using this user.
   Optionally the user may have apply rights, in which case the GitHub Actions 
   workflow will apply the changes.  

3. Create an API Token in HCP Terraform for the GitHub Actions user.

4. Upload the project source code into a GitHub repository.

5. Set the API token as a GitHub Actions repository secret called `TF_API_TOKEN`.

6. Edit the `.github/workflows/terraform-apply.yml` and `.github/workflows/terraform-plan.yml`
   files, update the `TF_CLOUD_ORGANIZATION` and `TF_WORKSPACE` variables.

7. The Terraform integration is ready to be used.

## Workflow

1. Engineers upgrading the infrastructure create a new feature branch.
2. Engineers update the infrastructure code and push them to the feature branch.
3. GitHub Actions performs a speculative `terraform plan` and comments its results
   in the pull request. This step behaves as a gate to prevent merging invalid or
   un-reviewed configurations into the main branch.
4. Fellow team member reviews the change and approves it, merging it into the main branch.
5. The `terraform apply` workflow is started, creating an apply run and accepting the change
   if permitted by HCP Terraform.
6. If the CI service user not permitted to apply the changes, somebody needs to log into
   Terraform cloud and accept the apply.

## Troubleshooting

If the apply pipeline terminates with the following error, the VCS integration is still enabled in the workspace. Switch it to either CLI or API-based workflow.

```
error while creating run in HCP Terraform: run has been specified as non-speculative and the workspace is currently locked
{
  "status": "Error"
}
```
