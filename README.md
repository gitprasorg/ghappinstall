# ghappinstall

This repository contains the infrastructure-as-code for managing GitHub App creation and configuration within your organization.

## Prerequisites

1.  **Create a GitHub App for Authentication:**
    *   Manually create a GitHub App in your organization. This app will be used to authenticate and create other apps.
    * Enterprise organization installations (write): To create and manage GitHub App installations across organizations in the enterprise.
Create and remove organizations for your enterprise (write): If the app needs to create new organizations (optional, depending on use case).
    *   Note the **App ID** and generate a **private key**.

2.  **Configure Repository Secrets:**
    *   Add the following secrets to your repository:
        *   `APP_ID`: The App ID of the authentication app.
        *   `PRIVATE_KEY`: The private key of the authentication app.

## Usage

### 1. Create a New GitHub App

1.  Navigate to the **Actions** tab of your repository.
2.  Select the **Create GitHub App** workflow.
3.  Click **Run workflow** and provide the following inputs:
    *   **App Name:** The name of the new GitHub App.
    *   **Organization:** The organization to create the app in.
    *   **Homepage URL (optional):** The homepage URL for the app.

The workflow will create the app and output its **App ID**, **Client ID**, and **Installation ID**.

### 2. Configure the App with Terraform

1.  **Create a `.auto.tfvars` file** for your application in the appropriate `orgs/<org_name>` directory.
2.  **Add the `github_app_installations` variable** to the file, mapping the app slug to its installation ID:

    ```json
    {
      "apm_code": "abcd",
      "org_name": "gitprasorg",
      "github_app_installations": {
        "your-app-slug": "your-installation-id"
      }
    }
    ```


