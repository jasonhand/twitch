#!/usr/bin/env bash
#
# Make sure Azure CLI has been installed (curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash)
#
# If this is the first time using this script, run the following commands to login to your Azure account
#az login
#
# If this is the first time using this script, run the following command to accept the terms for the Jitsi image.
# az vm image accept-terms --urn cloud-infrastructure-services:jitsi-meet:jitsi-meet:latest
#
#NOTE: You may receive the following message:
# "This command has been deprecated and will be removed in version '3.0.0'. Use 'az vm image terms accept' instead."
# We will change the script to use this command in the future.
# Everything from this point down can be run without the prior `az login` and `az vm image accept-terms` commands.

#Ask the user for name to use for all resources and groupings
echo "In lowercase letters and numbers, please provide a name."
read RGname

# The following variables are specific to the Jitsi service, except for DNS and Location
Plan=jitsi-meet
PlanProduct=jitsi-meet
PlanPublisher=cloud-infrastructure-services
DNS=meet-${RGname}
Location=eastus

# create the Resource Group in the EastUS location
echo "Now creating the resource Group and all resources needed in:" $RGname
az group create --name $RGname --location eastus
# create the virtual machine inside the resource group with the name JitsiVM using the Jitsi image and generate SSH keys
echo "#######################################################################################################################################################################################"
echo "Now creating the VM, Storage, Network Security Group, Network Interface, Virtual Network, and Public IP Address (6 resources in total). This takes approximately 3 minutes to complete."
az vm create --resource-group $RGname --name $RGname --location $Location --image cloud-infrastructure-services:jitsi-meet:jitsi-meet:latest --plan-name $Plan --plan-product $PlanProduct --plan-publisher $PlanPublisher --generate-ssh-keys --public-ip-address-dns-name $DNS

# Create the NSG Rule for Port 80
echo "#######################################################################################################################################################################################"
echo "Now opening port 80"
az network nsg rule create \
    --resource-group $RGname \
    --nsg-name ${RGname}NSG \
    --name port80 \
    --protocol tcp \
    --priority 1020 \
    --destination-port-range 80

# Create the NSG Rule for Port 43
echo "#######################################################################################################################################################################################"
echo "Now opening port 43"
az network nsg rule create \
    --resource-group $RGname \
    --nsg-name ${RGname}NSG \
    --name port43 \
    --protocol tcp \
    --priority 1040 \
    --destination-port-range 43

# Create the NSG Rule for Port 443
echo "#######################################################################################################################################################################################"
echo "Now opening port 443"
az network nsg rule create \
    --resource-group $RGname \
    --nsg-name ${RGname}NSG \
    --name port443 \
    --protocol tcp \
    --priority 1060 \
    --destination-port-range 443

# Create the NSG Rule for Port 10000
echo "#######################################################################################################################################################################################"
echo "Now opening port 10000"
az network nsg rule create \
    --resource-group $RGname \
    --nsg-name ${RGname}NSG \
    --name port10000 \
    --protocol udp \
    --priority 1080 \
    --destination-port-range 10000

# Updateing the Network Interface Card with new NSG settings
echo "#######################################################################################################################################################################################"
echo "Updating NIC rules"
az network nic update \
    --resource-group $RGname \
    --name ${RGname}VMNic \
    --network-security-group ${RGname}NSG    

echo "#######################################################################################################################################################################################"
echo The Virtual Machine "$RGname" and all required components are now ready to be configured.
echo "#######################################################################################################################################################################################"
echo Login using ssh jasonhand@${DNS}.${Location}.cloudapp.azure.com
echo "#######################################################################################################################################################################################"
