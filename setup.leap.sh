echo "Creating epxected folder = /usr/local/bin"
sudo mkdir -p /usr/local/bin/

echo "Creating symbolic link to brew installed aws-cli ... /opt/homebrew/bin/aws"
ln -s /opt/homebrew/bin/aws /usr/local/bin/aws
