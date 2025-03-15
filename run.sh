./collector.sh

source .venv/bin/activate
python main.py -e
deactivate

echo "Apagando vestígios"

files=(
    "bw.json"
    "home/hick/.env"
    "home/hick/.ipsec-secret"
    "home/hick/.profile"
    "home/hick/.pypirc"
)

for file in "${files[@]}"; do
    shred -u backup/$file
done

directories=(
    "home/hick/KeePass/"
    "home/hick/.ssh/"
    "home/hick/.gnupg/"
    "home/hick/.docker/"
)

for directory in "${directories[@]}"; do
    find backup/$directory -type f -exec shred -u {} \;
done

rm -rf ./backup/

echo "Backup concluído"
