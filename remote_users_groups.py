import subprocess

class UserLister:
	def __init__(self, host="debianlab"):
		self.host = host
		
	@property
	def users(self):
		result = subprocess.run(
			["ssh", self.host, "cat /etc/passwd"],
			capture_output=True, text=True
		)
		return [line.split(':')[0] for line in result.stdout.splitlines()]
	
lister = UserLister()
print(lister.users)