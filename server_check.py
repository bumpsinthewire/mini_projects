import subprocess

class ServerHealth:
	def __init__(self, host="debianlab"):
		self.host = host

	@property
	def disk(self):
		result = subprocess.run(
			["ssh", self.host, "df -h / | tail -n 1"],
			capture_output=True, text=True
		)
		return result.stdout.strip()

	@property
	def memory(self):
		mem_result = subprocess.run(
			["ssh", self.host, "free -h | grep 'Mem'"],
			capture_output=True, text=True
		)
		return mem_result.stdout.strip()

health = ServerHealth()
print(f"Disk:", health.disk)
print(f"Memory:", health.memory)