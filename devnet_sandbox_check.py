import os
import platform
from datetime import datetime

print("Which DevNet Sandbox always-on resources are reachable?")

# list of devices that have a public IP address
devices = {
	"ACI": "sandboxapicdc.cisco.com",
	"Catalyst Center": "sandboxdnac.cisco.com",
	"ISE": "devnetsandboxise.cisco.com",
	"IOS XE": "devnetsandboxiosxe.cisco.com",
	"IOS XR": "sandboxiosxr-1.cisco.com",
	"NSO": "sandbox-nso-1.cisco.com",
	"NX-OS": "sbx-nxos-mgmt.cisco.com",
	"SD-WAN": "sandbox-sdwan-2.cisco.com"
}

# adjust ping command depending on OS
ping_cmd = "ping -c 4 " if platform.system() != "Windows" else "ping -n 4 "

# redirect ping output to null device
redirect = " > /dev/null 2>&1" if platform.system() != "Windows" else " > nul 2>&1"

# track results
reachable = 0
total = len(devices)
timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

# loop over each entry in the devices dictionary and ping the device to see if it is reachable
for device, address in devices.items():
	response = os.system(ping_cmd + address + redirect)
	if response == 0:
		reachable += 1

# print the summary
print(f"\nResults at {timestamp}:")
print(f"Reachable: {reachable}/{total} sandboxes")
print(f"Not reachable: {total - reachable}/{total} sandboxes")