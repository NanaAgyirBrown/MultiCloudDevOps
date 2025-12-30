#!/bin/bash

# ====== CONFIG ======
SUBSCRIPTION_ID="d12bc67b-98b0-4ade-a46e-274894c491b7"

declare -A PAG_GROUPS=(
  ["pag_appservice_contributor"]="App Service Contributor|Tier2|Eligible,4h,approval,justification|/subscriptions/$SUBSCRIPTION_ID"
  ["pag_sql_db_contributor"]="SQL DB Contributor|Tier2|Eligible,4h,approval,justification|/subscriptions/$SUBSCRIPTION_ID"
  ["pag_storage_contributor"]="Storage Account Contributor|Tier2|Eligible,4h,approval,justification|/subscriptions/$SUBSCRIPTION_ID"
  ["pag_keyvault_contributor"]="Key Vault Contributor|Tier2|Eligible,2h,approval,justification|/subscriptions/$SUBSCRIPTION_ID"
  ["pag_network_contributor"]="Network Contributor|Tier2|Eligible,4h,approval,justification|/subscriptions/$SUBSCRIPTION_ID"
  ["pag_reader"]="Reader|Tier3|Eligible,8h|/subscriptions/$SUBSCRIPTION_ID"
  ["pag_monitoring_reader"]="Monitoring Reader|Tier3|Eligible,8h|/subscriptions/$SUBSCRIPTION_ID"
  ["pag_security_reader"]="Security Reader|Tier3|Eligible,8h|/subscriptions/$SUBSCRIPTION_ID"
  ["pag_cost_reader"]="Cost Management Reader|Tier3|Eligible,8h|/subscriptions/$SUBSCRIPTION_ID"
)

# ====== SCRIPT ======
for group in "${!PAG_GROUPS[@]}"; do
  IFS='|' read -r role tier pim scope <<< "${PAG_GROUPS[$group]}"

  echo "Creating group: $group"
  echo "  → Role: $role"
  echo "  → Tier: $tier"
  echo "  → PIM Config: $pim"
  echo "  → Scope: $scope"
  echo "--------------------------------"

  # Create the AAD group
  az ad group create \
    --display-name "$group" \
    --mail-nickname "$group" \
    --description "Privileged Access Group for $role ($tier)" \
    --only-show-errors

  # Get group ID
  groupId=$(az ad group show --group "$group" --query id -o tsv)

  # Assign RBAC role to group
  az role assignment create \
    --assignee-object-id "$groupId" \
    --role "$role" \
    --scope "$scope" \
    --only-show-errors

  echo "✅ $group assigned with $role"
  echo
done
