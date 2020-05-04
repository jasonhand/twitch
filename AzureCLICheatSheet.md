# Azure CLI Cheat Sheet

Quick list of things I use commonly from the command line (via Azure cli)

I belong to several subscriptions. This helps me quickly view all of them:  

```s
az account list --output table
```

----

To choose a subscription:  

```s
az account set --subscription <Name of Subscription>
```

----

To create a resource group:  

```s
az group create --name <Name of RG> --location eastus
```

To create a vm:  

```s
az vm create –-resource-group <Name of RG> –-name NAME_FOR_VM -–image UbuntuLTS –location eastus
```

[Full command reference for Azure CLI](https://docs.microsoft.com/en-us/cli/azure/reference-index?view=azure-cli-latest/?wt.mc_id=github-azclicheatsheet-jahand)