# Firestore Setup with Terraform

## Overview
This guide provides a detailed step-by-step process for setting up a Firestore database in GCP using Terraform.

## Prerequisites
- Google Cloud Project
- Service Account with necessary permissions
- Terraform installed on your local machine

## Files
- main.tf: Contains the main Terraform configuration.
- variables.tf: Defines the variables used in the configuration.
- outputs.tf: Defines the outputs of the Terraform run.
- terraform.tfvars: Contains the values for the variables.
- versions.tf: Terraform versions to use.

## Steps
1. *Initialize Terraform:*
   sh
   terraform init
   
2. **Plan and Apply
    sh
    terraform plan
    terraform apply
