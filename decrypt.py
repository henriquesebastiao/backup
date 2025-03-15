import getpass

import pyzipper

password = getpass.getpass('Senha: ').strip().encode('utf-8')

with pyzipper.AESZipFile('backup.zip') as zf:
    zf.setpassword(password)
    zf.extractall(path='backup-extraido')

print('Backup extraído')
