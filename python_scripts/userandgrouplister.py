class UserLister:
    def __init__(self, passwd_file="/etc/passwd", group_file="/etc/group"):
        self._passwd_file = passwd_file
        self._group_file = group_file

    @property
    def users(self):
        try:
            with open(self._passwd_file, 'r') as f:
                return [line.split(':')[0] for line in f]
        except FileNotFoundError:
            return ["File not found!"]
        except PermissionError:
            return ["Need sudo or higher perms!"]

    @property
    def groups(self):
        with open(self._group_file, 'r') as f:
            return [line.split(':')[0] for line in f]

lister = UserLister()
print(f"Users: {lister.users}")
print(f"Groups: {lister.groups}")
