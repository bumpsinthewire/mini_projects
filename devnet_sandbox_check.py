import os

print("Which DevNet Sandbox always-on resources are reachable?")

# list of devices that have a public IP address
devices = {"ACI": "https://sandboxapicdc.cisco.com",
		   "Catalyst Center": "https://sandboxdnac.cisco.com",
		   "ISE": "https://devnetsandboxise.cisco.com",
		   "IOS XE": "https://devnetsandboxiosxe.cisco.com",
		   "IOS XR": "https://sandboxiosxr-1.cisco.com",
		   "NSO": "https://sandbox-nso-1.cisco.com",
		   "NX-OS": "https://sbx-nxos-mgmt.cisco.com",
		   "SD-WAN": "https://sandbox-sdwan-2.cisco.com"
		   }

# loop over each entry in the devices dictionary and ping the device to see if it is reachable
for device, address in devices.items():
	response = os.system("ping -c 4 " + address)
	if response == 0:
		print(f"{device} is reachable")
	else:
		print(f"{device} is not reachable")

