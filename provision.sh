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

# clone app repo
git clone https://github.com/daraymonsta/tech201-sparta-app repo

# install npm
npm install --prefix ~/repo/app

#run app & will cause it to run in background so ctrl + c wont close the app
node ~/repo/app/app.js &
 

 