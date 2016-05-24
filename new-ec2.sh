

if ! command -v docker >/dev/null; then
  sudo yum update -y
  sudo yum install -y git
  sudo yum install -y docker
  sudo service docker start
  sudo usermod -a -G docker ubuntu
  echo "Log out, log in, source new-ec2.sh"
fi

export CODE_PATH=/home/ec2-user/src
export KEYS_PATH=/home/ec2-user/.keys
export CREDENTIALS_PATH=/home/ec2-user/.credentials


mkdir ${CODE_PATH}
cd ${CODE_PATH}
git clone https://github.com/zgazak/h2vc.git h2vc/
git clone https://github.com/zgazak/gutils.git gutils/

docker build -t postgres github.com/zgazak/postgres.git#master:9.5
docker build -t flask-prod ${CODE_PATH}/h2vc/flask-prod/
