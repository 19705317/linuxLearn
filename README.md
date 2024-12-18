# Linux notes

## Important Linux Commands

## Files and folders
command --help: will provide documentation of the command and the possible flags it can use

cd: move to directory | "cd ." go to current directory (useless) | "cd .." go back one directory | "cd ~" will take you to the home directory | "cd /root" will take you to root directory, requires root user privellages

cat: copy contents of file and paste to terminal | "cat /etc/shells" will output contents of shells folder within vm, bash is usually the default shell 

ls: list contents of directory to the terminal | "-a" flag will show all contents (including hidden) | "ls -l / -la" flag indicates the long format (-l for non hidden / -la includes hidden) can also concatenate the 2 flags as "ls -l -a" instead of "ls -la"

pwd: displays the present working directory the terminal is set to

exit: leaves virtual machine back to main diorectory gitbash was within (probably ssh key directory)

clear: makes a new line and scrolls that new line as the top of the terminal to make it seem all the text clutter has been cleaned

uname: provides the version of linux | "-p" flag will provide processor version | "-a" flag will provide all information

ps: shows the processes "-p" flag will tell you to give a specfic process "ps -p $$" dollar sign flags indicate to show the process currently being used

history: saves and shows to the console the 500 previous used commands in order used | "!x" can run a command used in order x "!10" would run command 10 from history | "-c" flag will remove the history

curl: a tool for data transfer "curl (link to image)" will download an image | extensions do not mess up linux .jpg can be .txt or .anything and linux will still recognise the file as a .jpg file

wget: same as curl "-o" flag for displaying the output once a file is downloaded

file: "file (filename) provides information about a file, like using properties in windows 

mv: "mv (filename) (directory)" moves a file or folder into a new directory | can also be used to rename file is giving parameters (mv) (file name) (new filename)

cp: copy a file | "cp (filename to copy) (file to overwrite)" will overwrite a file

rm: remove command "rm (filename)" | "-r" recursive flag, to delete a folder and delete everything inside of it | "rm -rf" will delete linux do not do this

mkdir: make a directory/folder | can't use spaces in linux have to use dashes or spaces "mkdir my pictures" will make 2 directories "my" and "pictures" | can make folder with space have to use quotes "mkdir "my pictures"", have to use speech marks when also referencing it in other commands "cd "my pictures""|

touch: create a blank file

nano: same as git bash, opens text editor "nano (filename)"

head: shows the top lines of a file "head -2" top 2 lines

tail: shows the bottom lines of a file "tail -2" bottom 2 lines

nl: numbers the lines of a file

grep: highlights a keyword within a file

| : pipeline "|" used to combine commands "cat chicken-joke.txt | grep chicken" will highlight the word chicken

apt install: downloads a package needs root privellages | "sudo apt update -y" "-y" flag will auto accept yes, "update" will update the packages from the internet, should be ran when launching new VM, safe command | "sudo apt upgrade" unsafe command, compares list of packages and if a newer version exists it will switch over to the new version, unsafe command

sudo: a prefix to other commands, runs commands as super user, stands for super user do | adhoc command (per command/for that specific command) | "sudo apt install tree"

sudo su: will take you to the root directory "su stands for switch user" sudo makes it automatically decide to switch to root user | after cd /root will take you to root directory, then "exit" switches you back to adminuser instead of root user


mv command followup:
        
        adminuser@cloudfun1-adrian-uks-main-vm:~$ mv funny-stuff/funny-jokes/chicken-joke.txt .  | moves chicken joke to current directory (.)
        adminuser@cloudfun1-adrian-uks-main-vm:~$ ls
        cat.jpg  chicken-joke.txt  funny-stuff
        adminuser@cloudfun1-adrian-uks-main-vm:~$ tree
        .
        ├── cat.jpg
        ├── chicken-joke.txt
        └── funny-stuff
            └── funny-jokes

        2 directories, 2 files
        adminuser@cloudfun1-adrian-uks-main-vm:~$ mv chicken-joke.txt funny-stuff/funny-jokes    | moves chicken joke to funny-stuff/funny-jokes directory from current directory
        adminuser@cloudfun1-adrian-uks-main-vm:~$ tree
        .
        ├── cat.jpg
        └── funny-stuff
            └── funny-jokes
                └── chicken-joke.txt

## Server commands

nano provision.sh : creates shell script
    begin shell script with:
        #Tell script what shell to use
        #!/bin/bash (shabang (#!) (shell path)): tells the script what shell for it to run in this case the bang shell

        #update
        sudo apt update -y

        #upgrade
        sudo apt upgrade -y

        #install nginx
        sudo apt install nginx -y

        #restart nginx
        sudo systemctl restart nginx

        #enable nginx
        sudo systemctl enable nginx

nginx runs on http
sudo systemctl restart nginx: "systemctl" lets you work with system commands, this example uses the "restart" command to restart the nginx package
sudo systemctl enable nginx: enables the package every time the virtual machine is started
sudo systemctl start nginx: manually enables the package, has to be done every time the virtual machine is booted
sudo systemctl status nginx: checks the status of the nginx package

to grant permission to run the provision.sh file:

    #gives execute permission (+x) to the file provision.sh
    sudo chmod +x provision.sh

    #runs provision.sh file (./) (. if in same directory if not specify path)
    ./provision.sh


## More linux commands

environment variables are accesible by other scripts, like python or java

printenv: print all environment variables | "print env USER" will print the user environemt variable

echo: "echo $MYNAME", need $ to reference the variable, command prints normal variables | MYNAME=Adrian will change MYNAME variable to Adrian 

export: "export MYNAME=adrian" will create a new environment variable MYNAME with value adrian | "printenv MYNAME" don't need $ to get environment variables | these are stored only for the session, will dissapear when relogging into the VM | "nano .bashrc" to make them persistent you have to put them in the .bashrc hidden file in the home directory, within .bashrc at the bottom type "export MYNAME=adrian" 

cd ~: stored in the HOME environment variable "printenv HOME"

source: "source .bashrc" used to run hidden files "./ .bashrc" will not work because .bashrc is hidden | .bashrc is ran every time a session is logged into

ps: shows user processes, ones user is currently running | "ps aux" to show more information

top: shows all running processes on the entire system | pressing m will sort by memory utalised | N (shift + N) will sort by latest process | P will sort by CPU usage

kill: "kill -1 (process ID)" will terminate the process | -15 will get rid of the process immediately

|: pipelining 2 commands (output is piplined from left to the right)

&&: command link (can connect to commands so both can be ran once on an enter push)

