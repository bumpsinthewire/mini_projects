import subprocess
import re

class UserLister:
	def __init__(self, host="debianlab"):
		self.host = host
		
	@property
	def get_users(self):
		result = subprocess.run(
			["ssh", self.host, "cat /etc/passwd"],
			capture_output=True, text=True
		)
		pattern = '^([a-zA-Z0-9_]+):[^:]*:(\d+):'

		users = []
		for line in result.stdout.splitlines():
			match = re.match(pattern, line)
			if match:
				uid = int(match.group(2))
				if uid >= 1000:
					users.append(match.group(1))
		return users
	
lister = UserLister()
print(lister.get_users)