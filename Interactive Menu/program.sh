#!/bin/bash

# Checks the current Disk usage
# Checks the current CPU usage
# Checks the current RAM usage
# Checks the Kernel version


server_name=$(hostname) # To display the current hostname of the system

function memory_check() {
    echo ""
    echo "Memory usage on $server_name is: "
    free -h
    echo ""
}

function cpu_check() {
    echo ""
    echo "CPU load on $server_name is: "
    echo ""
    uptime
    echo ""
}

function tcp_check() {
    echo ""
    echo "TCP connections on $server_name : "
    echo ""
    cat /proc/net/tcp | wc -l
    echo ""
}

function kernel_check() {
    echo ""
    echo "Kernel version on $server_name is: "
    echo ""
    uname -r
    echo ""
}

function check_all() {
    memory_check
    cpu_check
    tcp_check
    kernel_check
}

# Adding the menu

function menu() {
    echo -ne "
        My First Menu
        1) Memory Usage
        2) CPU Load
        3) Number of TCP Connections
        4) Kernel Version
        5) Checks All
        6) Exit
        Choose an option: 
    "
    
    read a
    case $a in 
        1) memory_check ; menu ;;
        2) cpu_check ; menu ;;
        3) tcp_check ; menu ;;
        4) kernel_check ; menu ;;
        5) check_all ; menu ;;
        6) exit 0 ;;
        *) echo "Wrong Option!" ;;
    esac
}


menu

