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

		users = [match.group(1) for line in result.stdout.splitlines()
		   if (match := re.match(pattern, line)) and int(match.group(2)) >= 1000]
	
lister = UserLister()
print(lister.get_users)