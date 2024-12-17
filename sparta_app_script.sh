!#/bin/bash

# update
sudo apt update -y

# upgrade (completely noninteractive)
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install nginx
sudo DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

# download noadjs shell script
curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_nodejs.sh

# run setup_nodejs.sh (bash is used to run the file) (this readies all the files)
sudo DEBIAN_FRONTEND=noninteractive bash setup_nodejs.sh

# sudo apt-get install nodejs (use "node -v" to get version)
sudo DEBIAN_FRONTEND=noninteractive apt-get install nodejs -y

# exit back to windows and transfer zip to ubunut
code goes here

# update after login back in
sudo apt-get update

# install unzip to unzip app code
sudo DEBIAN_FRONTEND=noninteractive apt-get install unzip

# unzip sparta app to home directory
unzip (zip name)

# install npm
nmp install

#run app & will cause it to run in background so ctrl + c wont close the app
node app.js & 

#to kill app
jobs -l
kill (npm PiD)
ps aux 
kill (node app.js PiD)

# connect DB to app
# create environment variable for private network in vnet to connect app to mongoDB
export DB_HOST=mongodb://10.0.3.4:27017/posts

#relaunch app
npm install
node app.js &
# reseed database content (node app.js will seed DB with 100 random content)

node seeds/seed.js