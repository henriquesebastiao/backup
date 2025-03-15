import argparse
import getpass
import os
import sys
import zipfile

import pyzipper

origin_folder = 'backup'

parser = argparse.ArgumentParser(description='Compacta uma pasta em um arquivo ZIP.')
parser.add_argument('-e', '--encrypt', action='store_true', help='Compactar com senha.')

args = parser.parse_args()

if not os.path.exists(origin_folder):
    print(f'A pasta {origin_folder} não existe.')
    sys.exit(1)

if args.encrypt:
    password = getpass.getpass('\nSenha: ').strip()
    print('Compactando backup')

    with pyzipper.AESZipFile(
        f'{origin_folder}.zip', 'w', compression=pyzipper.ZIP_LZMA, encryption=pyzipper.WZ_AES
    ) as zipf:
        zipf.setpassword(password.encode('utf-8'))
        zipf.setencryption(pyzipper.WZ_AES, nbits=256)
        for foldername, subfolders, files in os.walk(origin_folder):
            for file in files:
                file_path = os.path.join(foldername, file)
                arcname = os.path.relpath(file_path, origin_folder)
                zipf.write(file_path, arcname=arcname)
else:
    print('Compactando backup')
    with zipfile.ZipFile(f'{origin_folder}.zip', 'w', zipfile.ZIP_DEFLATED) as zipf:
        for foldername, subfolders, files in os.walk(origin_folder):
            for file in files:
                file_path = os.path.join(foldername, file)
                arcname = os.path.relpath(file_path, origin_folder)
                zipf.write(file_path, arcname=arcname)

print(f'Backup campactado no arquivo {origin_folder}.zip')
