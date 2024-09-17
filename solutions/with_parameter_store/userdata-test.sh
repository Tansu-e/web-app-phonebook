#! /bin/bash -x
dnf update -y
dnf install python3 -y
dnf install python-pip -y
pip3 install Flask==2.3.3
pip3 install Flask-MySql
pip3 install boto3
dnf install git -y
echo "tansu-phonebook-18.cvceeeq4k7jq.us-east-1.rds.amazonaws.com" > /home/ec2-user/dbserver.endpoint
cd /home/ec2-user
TOKEN=$(aws --region=us-east-1 ssm get-parameter --name /clarusway/phonebook/token --with-decryption --query 'Parameter.Value' --output text)
git clone https://$TOKEN@github.com/Tansu-e/web-app-phonebook.git
python3 /home/ec2-user/web-app-phonebook/web-app-phonebook/phonebook-app.py.yml

