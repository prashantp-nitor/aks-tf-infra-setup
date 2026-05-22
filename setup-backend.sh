#!/bin/bash
set -e

# ── Configuration ──────────────────────────────────────────────
RG="ppowar-backend-rg"
LOC="centralindia"
SA="ppowarbackendsa"
CONTAINER="tfstate"
# ───────────────────────────────────────────────────────────────

echo "==> Logging in to Azure..."
az login

echo ""
echo "==> Setting active subscription..."
SUBSCRIPTION_ID=$(az account show --query id -o tsv)
az account set --subscription "$SUBSCRIPTION_ID"
echo "    Using subscription: $SUBSCRIPTION_ID"

echo ""
echo "==> Creating Resource Group: $RG in $LOC..."
az group create \
  --name "$RG" \
  --location "$LOC"

echo ""
echo "==> Creating Storage Account: $SA..."
az storage account create \
  --name "$SA" \
  --resource-group "$RG" \
  --location "$LOC" \
  --sku Standard_LRS \
  --kind StorageV2 \
  --allow-blob-public-access false

echo ""
echo "==> Creating Blob Container: $CONTAINER..."
az storage container create \
  --name "$CONTAINER" \
  --account-name "$SA" \
  --auth-mode login

echo ""
echo "==> Assigning Storage Blob Data Contributor role to your account..."
ACCOUNT=$(az ad signed-in-user show --query id -o tsv)
SA_ID=$(az storage account show --name "$SA" --resource-group "$RG" --query id -o tsv)
az role assignment create \
  --assignee "$ACCOUNT" \
  --role "Storage Blob Data Contributor" \
  --scope "$SA_ID"

echo ""
echo "============================================"
echo "  Backend setup complete!"
echo "  Resource Group : $RG"
echo "  Storage Account: $SA"
echo "  Container      : $CONTAINER"
echo "  Location       : $LOC"
echo "============================================"
echo ""
echo "Your terraform/backend.tf is already configured for these values."
echo "Next step: create a service principal for GitHub Actions:"
echo ""
echo "  SUBSCRIPTION_ID=\$(az account show --query id -o tsv)"
echo "  az ad sp create-for-rbac \\"
echo "    --name ppowar-aks-sp \\"
echo "    --role Contributor \\"
echo "    --scopes /subscriptions/\$SUBSCRIPTION_ID \\"
echo "    --sdk-auth"
echo ""
echo "Copy the JSON output and add it as AZURE_CREDENTIALS secret in your GitHub repo."
