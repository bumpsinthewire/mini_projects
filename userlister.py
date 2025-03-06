class UserLister:
    @property
    def users(self):
        try:
            with open('/etc/passwd', 'r') as f:
                return [line.split(':')[0] for line in f]
        except PermissionError:
            return ["Need sudo or higher perms!"]

lister = UserLister()
print(lister.users)
