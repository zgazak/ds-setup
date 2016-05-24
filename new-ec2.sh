
if ! command -v docker >/dev/null; then
  sudo apt-get install yum
  sudo yum update -y
  sudo yum install -y docker
  sudo service docker start
  sudo usermod -a -G docker ubuntu
  echo "Log out, log in, source new-ec2.sh"
fi
