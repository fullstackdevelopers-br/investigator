#!/usr/bin/env bash

green='\e[1;34m'
cyan='\e[0;36m'
red='\e[1;31m'
yellow='\e[1;33m'

echo -e $green "
 _                       _    _             _            
| |._ _  _ _  ___  ___ _| |_ <_> ___  ___ _| |_ ___  _ _ 
| || ' || | |/ ._><_-<  | |  | |/ . |<_> | | | / . \| '_>
|_||_|_||__/ \___./__/  |_|  |_|\_. |<___| |_| \___/|_|  
                                <___'                    

 "
echo -e $red "Para chamar o menu de opções pressione ENTER"
echo -e $yellow "Digite o Número Desejado"
echo -e $cyan "                                          [Autor: Ezequiel L Sousa] [Organization: FullStackDevelopers-Br]"
echo ""


select i in  placas/ativas Desabilitar/eth0 Rotas portas/abertas Conexões/TCP processos/ativos uptime logins/efetuados endereços/configurados Rede Espaço/Disco Sistema Logs sair
do

   case "$i" in

   placas/ativas)
   echo "*** listar as placas ativas ***"
   ip addr
    ;;

   Desabilitar/eth0)
   echo "Desabilitar uma placa com endereço eth0)"
   ip link set down dev eth0
    ;;

   Rotas)
   echo " Ver as portas abertas roteamento computador:"
   ip route list
    ;;

   portas/abertas)
   echo "Investigar todas conexões: "
   ss -a
    ;;

   Conexões/TCP)
   echo " Conexões TCP conectadas do seu computador: "
   ss -tn state established
    ;;

   processos/ativos)
   echo "Verificar os processos ativos"
   ps auxf
    ;;

   uptime)
   echo "uptime"
   uptime
    ;;

   logins/efetuados)
   echo " mostra os logins efetuados no sistema:"
   who -lH
    ;;

   endereços/configurados)
   echo "endereços de rede configurados:"
   ip a list
    ;;

   Rede)
   echo "Rede"
   echo -e "[+] Verificando conexao com a Internet..."
   sleep 0.15
   echo -e " um momento!\n"
   ping google.com &> /dev/null
   if [ $? -gt 0 ]; then
   ping -c 1 uol.com.br &> /dev/null
   if [ $? -gt 0 ]; then
   echo "Verifique sua conexao..."
   echo ""
	 exit 1
   fi
   fi
   echo -e "[+] Internet OK!\n"
   sleep 0.15
   ;;
   
   Espaço/Disco)
   echo "Verificação de espaço em disco"
   df -h
   ;;

   Sistema)
   echo "Seu Sistema"
   cat /etc/os-release
   ;;

   Logs)
   echo "Verificação de Logs"
   tail -400 /var/log/messages
   ;;
   
   sair)
   echo "See you later!"
   break
   ;;

      *)
         echo "opcao invalida, tente novamente"
         ;;


   esac

done

exit 0
