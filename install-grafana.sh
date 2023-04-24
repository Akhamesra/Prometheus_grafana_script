# sudo yum update -y
# sudo yum install git -y
# git clone https://github.com/Akhamesra/Prometheus_grafana_script.git
# cd Prometheus_grafana_script
# sudo sh install-grafana.sh

# sudo nano /etc/yum.repos.d/grafana.repo
sudo cp grafana.repo /etc/yum.repos.d/grafana.repo
sudo yum install grafana
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server
sudo systemctl enable grafana-server.service