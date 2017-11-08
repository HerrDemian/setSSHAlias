#!/bin/bash
#setSshAlias. After copying make it executable with chmod +x setSshAlias.sh
 
#you can change this values
MYPASS="dumypass"
PWDFILE="/home/myusername/p.txt"
 
ALIASCOUNT=$(grep "alias ssh='ssh -B --password=file://$PWDFILE'" .bashrc -c)
 
#if Password file does not exist, create it
if [ -f "$PWDFILE" ]
then
        echo "$PWDFILE already exist, skipping this step"
else
        echo "$MYPASS" > $PWDFILE
fi
 
chmod 600 $PWDFILE
 
#if alias does not exist, create it
if [ $ALIASCOUNT == 0 ]
then
                echo "alias ssh='ssh -B --password=file://$PWDFILE'" >> ~/.bashrc
                echo "now close and open bash again and test it with "
                echo "ssh <server> 'hostname' "
else
                echo "ssh alias already exists"
fi            
 
exit 0
