# Backup

Scripts para criação de backup automatizado de arquivos importantes.

## Como executar

### Reunindo os arquivos para backup

Basta executar o script `collector.sh` com o comando:

```shell
./collector.sh
```

Os arquivos serão salvos no direório `./backup`.

### Compactando em um arquivo

Para compactar o backup em um arquivo `.zip` basta executar o script python:

```shell
python main.py
```

Você também pode compactar em um arquivo `.zip` com criptografia passando a flag `-e` para o script:

```shell
python main.py -e
```

Para a criptografia, uma senha será solicitada. Ao final você terá um arquivo `backup.zip` com seus arquivos.

### Extraindo arquivo criptografado

Para extrair seus arquivo de um `.zip` criptografado, basta executar o script `decrypt.py`:

```shell
python decrypt.py
```

Novamente a senha será solicitada. Seus arquivos serão extraídos para o diretório `./backup-extraido`

### Executar de uma vez só?

Caso queira apenas um comando, basta executar:

```shell
./run.sh
```

Esse script irá criar um backup criptografado e depois irá excluir a pasta backup com `shred`.