### Setup Configuration

apt-get clean
awk '$2=="hold" || $2 == "install" {print $1}' /tmp/apt.txt | 
  xargs -r apt-get -d -y reinstall'
