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

## Comandos e instalação do WSL
* Comando para saber se tem WSL instalado: ```wsl --status```
* Comando para instalar o WSL: ```wsl --install``` (Necessário ser Admin)
* Comando para atualizar o WSL: ```wsl --update```
* Comando para instalar o Ubuntu: ```wsl --install -d Ubuntu```
  - Ao instalar e carregar o Ubuntu vai pedir para cadastrar login e senha
* Comando para verificar a versão das instancias: ```wsl -l -v```
* Comando para alterar a versão do Ubuntu para 2.0: ```wsl --set-version Ubuntu 2```

***Obs:*** Todos os comando acima deve ser executado no terminal do WINDOWS


# Configure o WSL usando o CURL com o seguinte comando
Copie, cole e aperte enter no seguinte comando no terminal do Ubuntu:
```
curl https://raw.githubusercontent.com/cesargos/ScriptWslConfig/main/wslconfig.sh > wslconfig.sh
sed -i 's/\r//g' wslconfig.sh
sudo bash wslconfig.sh $USER
```
Depois siga as instruções apresentadas no terminal.

## Caso não esteja com internet configurada no WSL
Copie, cole e aperte enter no seguinte comando no terminal do Ubuntu:
```
sudo echo "nameserver 8.8.8.8" > /etc/resolv.conf
curl https://raw.githubusercontent.com/cesargos/ScriptWslConfig/main/wslconfig.sh > wslconfig.sh
sed -i 's/\r//g' wslconfig.sh
sudo bash wslconfig.sh $USER
```
Depois siga as instruções apresentadas no terminal.

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
 10. Siga as instruções apresentadas no terminal.
  
