# update gnupg and curl

sudo DEBIAN_FRONTEND=noninteractive apt-get install gnupg curl

# import mongodb public key

curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

# create list file

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# update the package

sudo apt-get update

# download specific version of mongoDB

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=7.0.6 mongodb-org-database=7.0.6 mongodb-org-server=7.0.6 mongodb-mongosh mongodb-org-mongos=7.0.6 mongodb-org-tools=7.0.6

# prevent mongdb package from upgrading

echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-database hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-mongosh hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

# change config of mongod local ip to default gateway

sudo sed -i.bak 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf && sudo systemctl restart mongod

# enable mongodb

sudo systemctl enable mongod

# fix permission for sock file

sudo rm -rf /tmp/mongodb-27017.sock

# make sure its enabled

sudo systemctl is-enabled mongod