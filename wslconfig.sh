#!/bin/bash

# sudo bash wslconfig.sh => para rodar
# sudo chmod -R 755 wslconfig.sh => para permitir a execução caso vc não tenha

FMT_RED=$(printf '\033[31m')
FMT_GREEN=$(printf '\033[32m')
FMT_YELLOW=$(printf '\033[33m')
FMT_BLUE=$(printf '\033[34m')
FMT_BOLD=$(printf '\033[1m')
FMT_RESET=$(printf '\033[0m')
# Exemplo de uso:  echo "${FMT_BLUE}seu texto colorido aqui...${FMT_RESET} seu texto normal aqui"


echo "${FMT_YELLOW}ATENÇÃO: Em caso de erro informando que '\\r' não é comando. Execute o seguinte comando:"
echo "sed -i 's/\\r//g' wslconfig.sh${FMT_RESET}"
echo "Seu usuário é $USER"
echo "O  Usuário passado via parametro é $1"
if [ -z $1 ]
then
  echo "${FMT_YELLOW}Execute o comando passando \$USER no final. Ex: ${FMT_BOLD}sudo bash wslconfig.sh \$USER${FMT_RESET}"
  exit 0
fi

if [ ! -d /home/$1 ]
then
  echo "${FMT_YELLOW}Nome de usuário inválido. Execute o comando passando \$USER no final. Ex: ${FMT_BOLD}sudo bash wslconfig.sh \$USER${FMT_RESET}"
  echo "${FMT_YELLOW}O usuário informado não possui pasta em /home/$1${FMT_RESET}"
fi

sleep 1
# cd /etc

# if [ $? -ne 0 ]
# then 
#   echo "##### Execute esse Script com sudo ####"
#   echo "" >> logPcConfg.txt
#   date >> logPcConfg.txt
#   echo "##### Execute esse Script com sudo ####" >> logPcConfg.txt

#   echo "Caso o Script não tenha permissão para executar. Conceda com 'sudo chmod +x pcconfig.sh'"
#   sleep 2
#   exit 0
# fi

echo "[boot]
command=\"echo 'nameserver 8.8.8.8' > /etc/resolv.conf\"
[network]
generateResolvConf = false" > /etc/wsl.conf

if [ $? -ne 0 ]
then 
  echo "${FMT_RED}##### Execute esse Script com sudo ####${FMT_RESET}"
  echo "" >> logPcConfg.txt
  date >> logPcConfg.txt
  echo "##### Execute esse Script com sudo ####" >> logPcConfg.txt

  echo "Caso o Script não tenha permissão para executar. Conceda com '${FMT_GREEN}sudo chmod +x pcconfig.sh${FMT_RESET}'"
  sleep 2
  exit 0
fi

echo "nameserver 8.8.8.8" > /etc/resolv.conf

apt update
echo ""
echo "############## FEITO UPDATE #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## FEITO UPDATE #######################" >> logPcConfg.txt

echo ""
sleep 1
apt upgrade
echo ""
echo "############## FEITO UPGRADE #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## FEITO UPGRADE #######################" >> logPcConfg.txt

echo ""
echo "Seu usuário é $USER"
sleep 1

cd ~
echo ""
echo "############## INSTALANDO O GIT #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## INSTALANDO O GIT #######################" >> logPcConfg.txt

sleep 1
echo ""
isThereTheProgram=$(git --version)
if [ $? -ne 0 ]
then
    apt install git
else
  echo "##### GIT já está instalado #####"
  echo "" >> logPcConfg.txt
  date >> logPcConfg.txt
  echo "##### GIT já está instalado #####" >> logPcConfg.txt

  sleep 1
fi



echo ""
echo "############## INSTALANDO O CURL #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## INSTALANDO O CURL #######################" >> logPcConfg.txt

sleep 1
echo ""
isThereTheProgram=$(curl --version)
if [ $? -ne 0 ]
then
    apt install curl
else
  echo "##### CURL já está instalado #####"
  echo "" >> logPcConfg.txt
  date >> logPcConfg.txt
  echo "##### CURL já está instalado #####" >> logPcConfg.txt

  sleep 1
fi


echo ""
echo "############## INSTALANDO O NVM (NODE VERSION MANAGER) #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## INSTALANDO O NVM (NODE VERSION MANAGER) #######################" >> logPcConfg.txt

sleep 1
echo ""

isThereTheProgram=$(nvm --version)
if [ $? -ne 0 ]
then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

	if [ $? -ne 0 ]
	then  
  		echo "### não foi possivel instalar o NVM Continue na sessao 10 ###"
  		echo "" >> logPcConfg.txt
  		date >> logPcConfg.txt
  		echo "### não foi possivel instalar o NVM Continue na sessao 10 ###" >> logPcConfg.txt

  		sleep 2
  		# exit 0
	fi
else
	echo "##### NVM já está instalado #####"
	echo "" >> logPcConfg.txt
	date >> logPcConfg.txt
	echo "##### NVM já está instalado #####" >> logPcConfg.txt

	sleep 1
fi


echo ""
echo "############## INSTALANDO O NODE 12 #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## INSTALANDO O NODE 12 #######################" >> logPcConfg.txt

sleep 1
echo ""


isThereTheProgram=$(node --version)
if [ $? -ne 0 ]
then
  nvm install 12.22.7
  
	if [ $? -ne 0 ]
	then 
  		echo "### não foi possivel instalar o NODE Continue na sessao 11 ###"
  		echo "" >> logPcConfg.txt
  		date >> logPcConfg.txt
  		echo "### não foi possivel instalar o NODE Continue na sessao 11 ###" >> logPcConfg.txt

  		sleep 2
  		# exit 0
	fi
else
	echo "##### NODE já está instalado #####"
	echo "" >> logPcConfg.txt
	date >> logPcConfg.txt
	echo "##### NODE já está instalado #####" >> logPcConfg.txt

	sleep 1
fi

# echo ""
# echo "############## INSTALANDO O SERVERLESS #######################"
# echo "" >> logPcConfg.txt
# date >> logPcConfg.txt
# echo "############## INSTALANDO O SERVERLESS #######################" >> logPcConfg.txt

# sleep 1
# echo ""

# isThereTheProgram=$(sls --version)
# if [ $? -ne 0 ]
# then
#   npm i -g serverless@2.25.2
# 	if [ $? -ne 0 ]
# 	then 
#   		echo "### não foi possivel instalar o SERVERLESS Continue na sessao 12 ###"
#   		echo "" >> logPcConfg.txt
#   		date >> logPcConfg.txt
#   		echo "### não foi possivel instalar o SERVERLESS Continue na sessao 12 ###" >> logPcConfg.txt

#   		sleep 2
#   		# exit 0
# 	fi
# else
# 	echo "##### SERVERLESS já está instalado #####"
# 	echo "" >> logPcConfg.txt
# 	date >> logPcConfg.txt
# 	echo "##### SERVERLESS já está instalado #####" >> logPcConfg.txt

# 	sleep 1
# fi




echo ""
echo "############## UPDATE E UPGRADE #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## UPDATE E UPGRADE #######################" >> logPcConfg.txt

sleep 1
echo ""

apt update
apt upgrade


echo ""
echo "############## INSTALANDO O DOCKER #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## INSTALANDO O DOCKER #######################" >> logPcConfg.txt

sleep 1
echo ""

isThereTheProgram=$(docker --version)
if [ $? -ne 0 ]
then
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


  apt-get update
  apt-get install docker-ce 
  if [ $? -ne 0 ]
  then 
    echo ""
    echo "############## ERRO AO INSTALAR O DOCKER-CE #######################"
    echo "" >> logPcConfg.txt
    date >> logPcConfg.txt
    echo "############## ERRO AO INSTALAR O DOCKER-CE #######################" >> logPcConfg.txt

    sleep 1
    echo ""
  fi

  apt-get install docker-ce-cli 
  if [ $? -ne 0 ]
  then 
    echo ""
    echo "############## ERRO AO INSTALAR O DOCKER-CE-CLI #######################"
    echo "" >> logPcConfg.txt
    date >> logPcConfg.txt
    echo "############## ERRO AO INSTALAR O DOCKER-CE-CLI #######################" >> logPcConfg.txt

    sleep 1
    echo ""
  fi

  apt-get install containerd.io
  if [ $? -ne 0 ]
  then 
    echo ""
    echo "############## ERRO AO INSTALAR O CONTAINERD.IO #######################"
    echo "" >> logPcConfg.txt
    date >> logPcConfg.txt
    echo "############## ERRO AO INSTALAR O CONTAINERD.IO #######################" >> logPcConfg.txt

    sleep 1
    echo ""
  fi

else
	echo "##### DOCKER já está instalado #####"
	echo "" >> logPcConfg.txt
	date >> logPcConfg.txt
	echo "##### DOCKER já está instalado #####" >> logPcConfg.txt

	sleep 1
fi


echo ""
echo "############## DANDO PERMISSÃO DE SUDO DOCKER PARA O USER: $1 #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## DANDO PERMISSÃO DE SUDO DOCKER PARA O USER: $1 #######################" >> logPcConfg.txt

usermod -aG docker $1
usermod -aG admin $1
if [ $? -ne 0 ]
then 
  echo ""
  echo "############## ERRO AO DAR PERMISSÃO DE SUDO PARA O DOCKER #######################"
  echo "" >> logPcConfg.txt
  date >> logPcConfg.txt
  echo "############## ERRO AO DAR PERMISSÃO DE SUDO PARA O DOCKER #######################" >> logPcConfg.txt

  sleep 1
  echo ""
fi

echo ""
echo ""
echo "${FMT_YELLOW}Use '${FMT_BOLD}sudo service docker start${FMT_RESET}${FMT_YELLOW}' para iniciar o docker e '${FMT_BOLD}sudo service docker stop${FMT_RESET}${FMT_YELLOW}' para finalizar o docker${FMT_RESET}"
echo "${FMT_GREEN}Aperte Enter para continuar${FMT_RESET}"
read

echo ""
echo "############## INSTALANDO O DOCKER COMPOSE #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## INSTALANDO O DOCKER COMPOSE #######################" >> logPcConfg.txt

sleep 1
echo ""



isThereTheProgram=$(docker-compose --version)
if [ $? -ne 0 ]
then
  curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
  if [ $? -ne 0 ]
  then 
    echo ""
    echo "############## ERRO AO INSTALAR O DOCKER CONPOSE #######################"
    echo "" >> logPcConfg.txt
    date >> logPcConfg.txt
    echo "############## ERRO AO INSTALAR O DOCKER CONPOSE #######################" >> logPcConfg.txt

    sleep 1
    echo ""
  fi
else
	echo "##### DOCKER COMPOSE já está instalado #####"
	echo "" >> logPcConfg.txt
	date >> logPcConfg.txt
	echo "##### DOCKER COMPOSE já está instalado #####" >> logPcConfg.txt

	sleep 1
fi



echo ""
echo "############## INSTALANDO O MAKER #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## INSTALANDO O MAKER #######################" >> logPcConfg.txt

sleep 1
echo ""


isThereTheProgram=$(make --version)
if [ $? -ne 0 ]
then
  apt-get install make
  if [ $? -ne 0 ]
  then 
    echo ""
    echo "############## ERRO AO INSTALAR O MAKE #######################"
    echo "" >> logPcConfg.txt
    date >> logPcConfg.txt
    echo "############## ERRO AO INSTALAR O MAKE #######################" >> logPcConfg.txt

    sleep 1
    echo ""
  fi
else
	echo "##### MAKE já está instalado #####"
	echo "" >> logPcConfg.txt
	date >> logPcConfg.txt
	echo "##### MAKE já está instalado #####" >> logPcConfg.txt

	sleep 1
fi

echo "############## INSTALANDO O ZSH #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## INSTALANDO O ZSH #######################" >> logPcConfg.txt

sleep 1
echo ""
isThereTheProgram=$(zsh --version)
if [ $? -ne 0 ]
then
    echo "${FMT_BOLD}ATENÇÃO: ${FMT_GREEN}Vc vai instalar e depois entrar no zsh automaticamente. Caso peça para configurar, escolha a opção 2 e depois digite 'exit' + <ENTER>${FMT_RESET}"
    echo "${FMT_GREEN}Aperte enter para continuar${FMT_RESET}"
    read
    echo "##### Instalando #####"
    echo "" >> logPcConfg.txt
    date >> logPcConfg.txt
    echo "##### Instalando #####" >> logPcConfg.txt

    apt install zsh
else
  echo "##### ZSH já está instalado #####"
  echo "" >> logPcConfg.txt
  date >> logPcConfg.txt
  echo "##### ZSH já está instalado #####" >> logPcConfg.txt

  sleep 1
fi

chsh -s $(which zsh)
if [ $? -ne 0 ]
then
    chsh -s $(which zsh)
    echo "##### Erro ao configurar o ZSH como padrão #####"
    echo "" >> logPcConfg.txt
    date >> logPcConfg.txt
    echo "##### Erro ao configurar o ZSH como padrão #####" >> logPcConfg.txt

else
  echo "##### ZSH foi confgurado como padrão #####"
  echo "" >> logPcConfg.txt
  date >> logPcConfg.txt
  echo "##### ZSH foi confgurado como padrão #####" >> logPcConfg.txt

  sleep 1
fi




echo 'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion' >> ~/.zshrc




echo ""
echo "############## CONFIGURANDO O GIT #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## CONFIGURANDO O GIT #######################" >> logPcConfg.txt

sleep 1
echo ""
regex="^\w.+@\w.*\.\w"
echo -n "${FMT_BOLD}Digite o seu email do github: ${FMT_RESET}"
read email
while [[ ! $email =~ $regex ]]
do
    echo -n "${FMT_BOLD}Digite um email válido: ${FMT_RESET}"
    read email
done
echo ""
regex="\w{2,}"
echo -n "${FMT_BOLD}Digite o seu username do github:${FMT_RESET} "
read username
while [[ ! $username =~ $regex ]]
do
    echo -n "${FMT_BOLD}Digite um username válido:${FMT_RESET} "
    read username
done
 
git config --global user.email "$email"
git config --global user.name "$username"

echo "############## GERANDO CHAVE SSH #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## GERANDO CHAVE SSH #######################" >> logPcConfg.txt
echo ""
sleep 2
echo "${FMT_YELLOW}${FMT_BOLD}A seguir vamos gerar uma chave SSH para vc. Digite enter 3 vezes nas perguntas.${FMT_RESET} Passo 15"

ssh-keygen -t rsa -b 4096 -C "$email"
echo "A seguir configure o seu github. "
echo "Copie e cole a chave ssh a seguir no seu github"
echo ""
sleep 2
cat ~/.ssh/id_rsa.pub
if [ $? -ne 0 ]
then 
  sleep 2
  echo "#### Aparentemente a chave ssh não foi gerada na sua home ####"
  echo "" >> logPcConfg.txt
  date >> logPcConfg.txt
  echo "#### Aparentemente a chave ssh não foi gerada na sua home ####" >> logPcConfg.txt

  sleep 1
  chavessh=$(cat /root/.ssh/id_rsa.pub)
  if [ $? -ne 0 ]
  then 
    echo "#### Ela tb não foi gerada na root. Verifique o passo 15 para continuar ####"
    echo "" >> logPcConfg.txt
    date >> logPcConfg.txt
    echo "#### Ela tb não foi gerada na root. Verifique o passo 15 para continuar ####" >> logPcConfg.txt

  else
    echo "### Sua chave foi gerada na root. ###"
    echo "" >> logPcConfg.txt
    date >> logPcConfg.txt
    echo "### Sua chave foi gerada na root. ###" >> logPcConfg.txt

    sleep 1
    echo "Verifique o passo 15 em caso de erro"
    sleep 2
    echo "Aperte ENTER para continuar"
    read
    echo ""
    echo "${FMT_YELLOW}Copie e cole a chave ssh a seguir no seu github. ${FMT_BOLD}Começando pelo 'ssh' ate o '.com(.br)'${FMT_RESET}${FMT_YELLOW}. Depois rode o comando '${FMT_BOLD}ssh -T git@github.com${FMT_RESET}${FMT_YELLOW}' para verificar se o seu github esta sincronizado${FMT_RESET}"
    echo ""
    sleep 3
    echo $chavessh

  fi
else
  echo ""
  echo "${FMT_YELLOW}Copie e cole a chave ssh a seguir no seu github. ${FMT_BOLD}Começando pelo 'ssh' ate o '.com(.br)'${FMT_RESET}${FMT_YELLOW}. Depois rode o comando '${FMT_BOLD}ssh -T git@github.com${FMT_RESET}${FMT_YELLOW}' para verificar se o seu github esta sincronizado${FMT_RESET}"
  echo ""
  sleep 3
  echo "${FMT_BOLD} $chavessh ${FMT_RESET}"
  
fi

for content in $( ls -la /root | awk '{ print $9 }' | grep '\w' )
do
        if [ -f $content ]
        then
                cp /root/$content /home/$1/$content
                chown $1:$1 /home/$1/$content
        elif [ -d $content ]
        then
                cp /root/$content -r /home/$1/$content
                chown -hR $1:$1 /home/$1/$content
        else
                echo "Não existe: $content"
        fi

#       cp $content /home/$1/teste
done
echo "#\!/bin/bash

echo \"############## INSTALANDO O ZSH #######################\"
echo \"\" >> logPcConfg.txt
date >> logPcConfg.txt
echo \"############## INSTALANDO O ZSH #######################\" >> logPcConfg.txt

sleep 1
echo \"\"
isThereTheProgram=\$(zsh --version)
if [ \$? -ne 0 ]
then
    echo \"ATENÇÃO: Vc vai instalar e depois entrar no zsh automaticamente. Caso peça para configurar, escolha a opção 2 e depois digite 'exit' + <ENTER>\"
    echo \"Aperte enter para continuar\"
    read
    echo \"##### Instalando #####\"
    echo \"\" >> logPcConfg.txt
    date >> logPcConfg.txt
    echo \"##### Instalando #####\" >> logPcConfg.txt

    apt install zsh
else
  echo \"##### ZSH já está instalado #####\"
  echo \"\" >> logPcConfg.txt
  date >> logPcConfg.txt
  echo \"##### ZSH já está instalado #####\" >> logPcConfg.txt

  sleep 1
fi

chsh -s \$(which zsh)
if [ \$? -ne 0 ]
then
    chsh -s \$(which zsh)
    echo \"##### Erro ao configurar o ZSH como padrão #####\"
    echo \"\" >> logPcConfg.txt
    date >> logPcConfg.txt
    echo \"##### Erro ao configurar o ZSH como padrão #####\" >> logPcConfg.txt

else
  echo \"##### ZSH foi confgurado como padrão #####\"
  echo \"\" >> logPcConfg.txt
  date >> logPcConfg.txt
  echo \"##### ZSH foi confgurado como padrão #####\" >> logPcConfg.txt

  sleep 1
fi



echo \"\"
echo \"############## INSTALANDO O OH-MY-ZSH #######################\"
echo \"\" >> logPcConfg.txt
date >> logPcConfg.txt
echo \"############## INSTALANDO O OH-MY-ZSH #######################\" >> logPcConfg.txt

sleep 1
echo \"\"
sh -c \"\$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"
if [ \$? -ne 0 ]
then
  \"Não foi possível instalar o OH-MY-ZSH\"
  echo \"\" >> logPcConfg.txt
  date >> logPcConfg.txt
  echo \"############## Não foi possível instalar o OH-MY-ZSH #######################\" >> logPcConfg.txt

  sleep 2
else
 
  echo \"\"
  echo \"############## INSTALANDO O THEMA DRACULA NO ZSH #######################\"
  echo \"\" >> logPcConfg.txt
  date >> logPcConfg.txt
  echo \"############## INSTALANDO O THEMA DRACULA NO ZSH #######################\" >> logPcConfg.txt

  sleep 1
  echo \"\"
  git clone https://github.com/dracula/zsh.git
  ln -s ~/zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme

  sed -i 's/\W*ZSH_THEME=.*/ZSH_THEME=\"dracula\"/g' ~/.zshrc

fi
echo \" \$(printf '\033[33m')Script finalizado agora reinicie o terminal e depois instale o serverless com o comando:\"
echo \" \$(printf '\033[1m')npm i -g serverless@2.25.2 \$(printf '\033[0m')\"

" > /home/$1/zshconfig.sh
chown $1:$1 /home/$1/zshconfig.sh
sleep 5

echo ""
echo ""
echo "############## SCRIPT FINALIZADO #######################"
echo "" >> logPcConfg.txt
date >> logPcConfg.txt
echo "############## SCRIPT FINALIZADO #######################" 
echo "${FMT_YELLOW}AGORA EXECUTE O COMANDO ${FMT_BOLD}bash zshconfig.sh ${FMT_RESET}${FMT_YELLOW}(sem o sudo) ${FMT_RESET}"
 
