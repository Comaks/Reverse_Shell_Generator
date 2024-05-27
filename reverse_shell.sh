#!/bin/bash
green='\e[91m'
end='\e[1m'
function header {
    clear
    figlet -f slant -c "Reverse Shell Generator" | lolcat;figlet -f digital -c "by 1ms"  | lolcat
}
function check_figlet_lolcat {

    if ! command -v figlet &> /dev/null
    then
        sudo apt-get install -y figlet
    else
        echo ""
    fi
    if ! command -v lolcat &> /dev/null
    then
        sudo apt-get install -y lolcat
    else
        echo ""
    fi
}
function payloads {
    echo "1-)Bash"
    echo "2-)Perl"
    echo "3-)Python"
    echo "4-)PHP"
    echo "5-)Ruby"
    echo "6-)Netcat"
}
function lang {
    echo  -e ${green}"Select language. / Dil Seçiniz."
    echo "1-English"
    echo "2-Türkçe"
    echo -ne "---> "${end}
    read lang
}
function first_payload {
    if [ $lang -eq 1 ]
    then 
        header
        echo -e ${green}"Please Select Payload."
        payloads
        echo
        echo -ne "Choice: "${end}
        read first_payload
        ip_port
    elif [ $lang -eq 2 ]
    then

        header
        echo -e ${green}"Lütfen Reverse Shell Payload'unu seçiniz."
        payloads
        echo
        echo -ne "Seçim: "${end}
        read first_payload
        ip_port
    fi
}

function ip_port {
    header
    echo -ne ${green}"IP: "
    read ip
    echo -ne "Port: "${end}
    read port

}

function second_payload {
    if [ $lang -eq 1 ]
    then 
        first_payload=$first_payload
        ip=$ip
        port=$port
        ./payload_en.sh "$first_payload" "$ip" "$port"
    elif [ $lang -eq 2 ]
    then
        first_payload=$first_payload
        ip=$ip
        port=$port
        ./payload_tr.sh "$first_payload" "$ip" "$port"
    fi
}

# terminal_turu=$TERM
# echo "Terminal türü: $terminal_turu"

# echo $terminal_turu
check_figlet_lolcat
header
lang
first_payload
second_payload
