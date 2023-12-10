import subprocess, dotbot

class WinGet(dotbot.Plugin):
    _directive = 'winget'

    def can_handle(self, directive):
        return self._directive == directive

    def handle(self, directive, data):
        if directive != self._directive:
            raise ValueError('winget cannot handle directive %s' %
                directive)

        success = True

        for app in data:
            try:
                subprocess.run(
                        ['winget install '+app],
                        shell=True,
                        check=True)
            except subprocess.CalledProcessError:
                success = False

        if success:
            self._log.info('All packages have been installed')
        else:
            self._log.error('Some packages were not successfully installed')
        return success