# Roll Your Own Jitsi Service on Azure (pt. 2)

Now that we have [our virtual machine running](../pt1/README.md) and ready we can begin setting up our Jitsi service.

## Virtual Machine Config

There are a few things we need to tweak on our newly created virtual machine before we can begin the Jetsi setup.

We need to:

1. Open the ports needed to finish the setup
2. Assign a fully qualified domain name to the server
3. Enable remote SSH access to the server and connect
4. Connect to and update the server
5. Add an entry to our `hosts` file

### 1. Open Required Ports

>NOTE: This is already done if you use the template

[Manually opening port `80`, `43`, `443`, and `10000` from the Portal through the `networking` blade](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/nsg-quickstart-portal/?wt.mc_id=github-twitch06-jahand). All ports are TCP except for 10000. It is UDP. Be sure to give each a unique name.

### 2. Configure DNS on Virtual Machine

- [From the VM's overview blade click on the `Configure` link under `DNS name`](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/portal-create-fqdn/?wt.mc_id=github-twitch06-jahand)
- Leave the `Assignment` as "Dynamic" and enter a DNS name label (ex. meet-jitsi) and press Save
- From the overview screen refresh the details and you should now see your "fully qualified domain name" (ex. `meet-jitsi.eastus.cloudapp.azure.com`)

### 3. Enable SSH

- From within the portal, browse the VM
- [Select the `Connect` by `SSH` from the top toolbar in the Overview blade](https://docs.microsoft.com/en-us/azure/marketplace/cloud-partner-portal/virtual-machine/cpp-connect-vm/?wt.mc_id=github-twitch06-jahand)

### 4. Connect to the server via SSH

Using the following command, connect to the server via ssh:

`ssh username@dns-name-you-chose` (ex. ssh jasonhand@meet-jitsi.eastus.cloudapp.azure.com)

### 4.1 Update and Upgrade the system

Once successfully logged in to the remote Ubuntu server, run the following to update the system.

```s
sudo apt update
```

Once complete, run...

```s
sudo apt upgrade
```

The server is now up to date with all recent package enhancements and improvements. We are ready to give our server a domain name to be used as the address of our Jitsi server. 

In this example I'm using `cloudavision.com` as my top level domain (TLD). I will create a CNAME entry in my DNS settings with the domain registrar. In this example, it is GoDaddy.

### 5. Edit the hosts file

- From the overview blade of the VM, copy the IP address to your clipboard.

- From my SSH session to the server, open the hosts file by running the following:

`sudo vi /etc/hosts`

- Using the arrow keys, move to the first open line and press the `i` key to "insert".

- Paste the IP address of the VM from your clipboard
- Followed by a space, type `localhost`
- Followed by another space, type the domain name you plan to use *(ex. meet.cloudavision.com)*

>NOTE: [Steps to **Add a CNAME record** can be found below](#add-cname-record)

- Press `Enter` to create a new line
- Press `Esc` to exit "insert mode"
- Type `:wq` to "write" and "quit" the editor.

### Download and install the Package Configution

- From the command line, download and install jitsi with the following command:
   `sudo apt-get -y install jitsi-meet`
- Once Package Configuration App opens add the domain you plan to use in the `hostname` field. (ex. *meet.cloudavision.com*)

- `Generate a new self-signed certificate` by pressing `Enter`
- Setup the certificate by running the following:
   `sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh`
- Press enter after inputting your email

Once the [Let's Encrypt](https://letsencrypt.org/) script completes you should see a "Congratulations" message.

At this point, we are ready to test out our Jitsi deployment.

To view your deployment, open a new tab and browse to your CNAME (ex. [https://meet.cloudavision.com](https://meet.cloudavision.com)).

You should see the landing page with a form in the middle to provide a room name and start a video conference session.

## Cost and other Considerations

We didn't specifiy the size of the VM.. so we got what?

It seems sufficient to handle at least one video chat but how many can it handle before it starts to have problems? When running `htop` there are a ton of java errors mentioning `HeapDumpOnOutOfMemoryError`. I wonder if a larger machine would also have these errors? For each new connection I add (up to three) I see more and more memory related errors in `htop`.

Looking deeper:

I started on a Machine of size: `Standard DS1 v2 (1 vcpus, 3.5 GiB memory)`.

### Attempt to resize

- Click on `Size` under settings on the left
- Choose something larger like 'DS3_v2` (note. I'm in an active call during this but it appears that things are stopping and the server is shutting down)

After restarting and testing, the server still kicks out a lot of memory errors. At first I thought the quality of the video was better on the larger machine but I'm not sure that wasn't a latency issue on my Mac earlier.

Also keep in mind that anyone who knows the URL can create a room. More on that here: https://pandascience.net/tutorials/jitsi-meet-on-ubuntu-19-10/

Can I use a different Ubuntu image? It's not clear why I had to download and install the jetsi-meet application or open up ports 80, 443, 4443, and 10000.

### Enable Application Insights

We want as much observable data we can collect on our systems as possible, to help inform data driven improvements and changes.

>NOTE: Enabling Application Insights and then running a couple of calls provides some cool visuals in the Application Map

https://docs.microsoft.com/en-us/cli/azure/ext/application-insights/monitor/app-insights?view=azure-cli-latest

https://docs.microsoft.com/en-us/azure/azure-monitor/app/app-map?tabs=net

### Add CNAME Record

The public DNS for my VM is : `demo-jitsi.eastus.cloudapp.azure.com`.

I want to configure a shorter domain to point to redirect to the cloudapp.azure address. I will need to make changes to my DNS settings on Godaddy, where the domain is registered and DNS is managed.

- Login to DNS Manager (ex. Godaddy)
- Choose a domain (ex. Cloudavision.com)
- Add a `CNAME` with host `meet` that points to the domain name configured (ex. `demo-jitsi.eastus.cloudapp.azure.com`)

### Customize the Interface

I haven't looked much in to how to customize my instance. The first thing that I obviously wanted to remove was the watermark. That was actually pretty easy.

You can remove the watermark and make minor changes here:

```s
sudo vi /usr/share/jitsi-meet/interface_config.js
```

### Automating the process

Now that we have the steps needed to create the vm, we can begin to automate some of the tasks. We can do this with a simple bash script.

Take a look at this very basic bash script I made to deploy all resources needed for a Jitsi VM - [CreateVM.sh](/ep06/bash/createVM.sh)

Here you will find a script to automate the process of creating all resources needed. Once the virtual machine is deployed, you can [pick up at the beginning of Part 2 in this tutorial](/pt2/README.md).

You can download the script to your local machine by running the following:

`curl 'https://raw.githubusercontent.com/jasonhand/twitch/master/ep06/bash/createVM.sh' > createVM.sh`

Make the file executable by running the following:

`chmod 777 createVM.sh`

Then run the script with the following:

`./createVM.sh`

The script will prompt you to provide a name. Whatever you enter will be the name of the Resource Group and used to create all addtional resources. You need to use lowercase letters to avoid an error.

### Additional Resources

[Configuring a custom domain name for an Azure cloud service](
https://docs.microsoft.com/en-us/azure/cloud-services/cloud-services-custom-domain-name-portal?wt.mc_id=github-twitch06-jahand)

https://docs.microsoft.com/en-us/cli/azure/network/nsg?view=azure-cli-latest#az-network-nsg-create?wt.mc_id=github-twitch06-jahand

https://docs.microsoft.com/en-us/azure/virtual-machines/linux/nsg-quickstart?wt.mc_id=github-twitch06-jahand
