#!/usr/bin/expect  
# 参数1：远程host；参数2：远程用户 参数3: Yubi Key
if { $argc != 3 } {  
    send_user "Usage: host password\n"  
    exit  
}  

set remote_host [lindex $argv 0]  
set remote_usr [lindex $argv 1]
set yubi_key [lindex $argv 2] 
  
set kerberos_host  ""
set kerberos_usr ""
set kerberos_pass ""

set kinit_pwd kinit_pwd3

# 登录跳板机  
catch {spawn ssh -l $kerberos_usr $kerberos_host  }  

#auth
expect "YubiKey for*" {send "$yubi_key\r"}
expect "Password*" {send "$kerberos_pass\r"}

#kinit
expect "*]" {send "kinit\r"}
expect "*assword*" {send "$kinit_pwd\r"}

# 登录远程机器  
expect "*]" { send "rlogin $remote_host -l $remote_usr\r" }  

expect "*" { send "alias cls=clear\r" }

interact
