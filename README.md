# ScriptWslConfig
Aplica automaticamente as configurações desse arquivo: https://cesargos.notion.site/Configurando-WSL-037ebeba4f944617b2b6035e93b443f3
### Configura:
- usuário do GIT 
- SSH para configurar no GitHub. 
- Coloca o DNS no Boot. 
### Instala:
- Git
- Curl
- NVM
- Node v.12
- Docker(CE)
- Docker-Compose
- Make
- ZSH
- OH-MY-ZSH (com Dracula)

## Instale usando o CURL com o seguinte comando
```
curl https://raw.githubusercontent.com/cesargos/ScriptWslConfig/main/wslconfig.sh > wslconfig.sh
sed -i 's/\r//g' wslconfig.sh
sudo bash wslconfig.sh $USER
```

## Caso não esteja com internet configurada no WSL
Copie, cole e aperte enter no seguinte comando no terminal:
```
sudo echo "nameserver 8.8.8.8" > /etc/resolv.conf
curl https://raw.githubusercontent.com/cesargos/ScriptWslConfig/main/wslconfig.sh > wslconfig.sh
sed -i 's/\r//g' wslconfig.sh
sudo bash wslconfig.sh $USER
```

## Caso não dê certo tente fazer manualmente:
1. Entre no arquivo wslconfig.sh: https://raw.githubusercontent.com/cesargos/ScriptWslConfig/main/wslconfig.sh
2. Aperte ```Ctrl + A```
3. Aperte  ```Ctrl + C```
4. Digite no terminal do wsl que esta instalado o UBUNTU: ```nano wslconfig.sh```
5. Cole usando ```Ctrl + V``` 
6. Aperte ```Ctrl + X``` para Sair 
7. Aperte  "Y" para salva
8. Aperte ENTER para confirmar o nome
9. Agora voltando ao terminal. Copie e cole o seguinte comando:
  ```
  sed -i 's/\r//g' wslconfig.sh
  sudo bash wslconfig.sh $USER
  ```
  
