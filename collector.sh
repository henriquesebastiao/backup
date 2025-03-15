backup_folder="backup"
user_path="$backup_folder/home/hick"

echo "Salvando arquivos no diretório ./$backup_folder"

if [ ! -d "$backup_folder" ]; then
  mkdir "$backup_folder"
fi

# Copia documentos

directories=("branding" "estudos" "imposto-de-renda" "livros")

for dir in "${directories[@]}"; do
  if [ ! -d "$backup_folder/home/hick/documentos/$dir" ]; then
    mkdir -p "$backup_folder/home/hick/documentos/$dir"
  fi
done

if [ ! -d "$backup_folder/home/hick/KeePass/" ]; then
  mkdir -p "$backup_folder/home/hick/KeePass/"
fi

# Copia arquivos do KeePass

cp -r ~/KeePass "$user_path/KeePass/"

directories=("branding" "estudos" "imposto-de-renda" "livros")

for dir in "${directories[@]}"; do
  cp -r ~/Documentos/$dir "$user_path/documentos/"
done

# Copia imagens

if [ ! -d "$backup_folder/home/hick/imagens/profile/" ]; then
  mkdir -p "$backup_folder/home/hick/imagens/profile/"
fi

cp -r ~/Imagens/profile "$user_path/imagens/"

# Copia dotfiles

cp ~/.profile "$user_path/"

if [ ! -d "$backup_folder/home/hick/.docker/" ]; then
  mkdir -p "$backup_folder/home/hick/.docker/"
fi

cp ~/.docker/config.json "$user_path/.docker/"

if [ ! -d "$backup_folder/home/hick/.gnupg/" ]; then
  mkdir -p "$backup_folder/home/hick/.gnupg/"
fi

cp -r ~/.gnupg "$user_path/"

cp ~/.ipsec-secret "$user_path/"

cp ~/.pypirc "$user_path/"

if [ ! -d "$backup_folder/home/hick/.ssh/" ]; then
  mkdir -p "$backup_folder/home/hick/.ssh/"
fi

cp -r ~/.ssh "$user_path/"

env >"$user_path/.env"
