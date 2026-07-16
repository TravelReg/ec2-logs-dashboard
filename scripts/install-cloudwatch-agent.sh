sudo apt update

sudo apt install amazon-cloudwatch-agent -y

sudo cp amazon-cloudwatch-agent.json \
/opt/aws/amazon-cloudwatch-agent/etc/

sudo systemctl restart amazon-cloudwatch-agent