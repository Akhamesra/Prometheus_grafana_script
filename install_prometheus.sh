# sudo yum update -y
# sudo yum install git -y
# git clone https://github.com/Akhamesra/Prometheus_grafana_script.git
# cd Prometheus_grafana_script
# sudo sh install_prometheus.sh

sudo useradd --no-create-home prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz
tar -xvf prometheus-2.43.0.linux-amd64.tar.gz
sudo cp prometheus-2.43.0.linux-amd64/prometheus /usr/local/bin
sudo cp prometheus-2.43.0.linux-amd64/promtool /usr/local/bin
sudo cp -r prometheus-2.43.0.linux-amd64/consoles /etc/prometheus/
sudo cp -r prometheus-2.43.0.linux-amd64/console_libraries /etc/prometheus
sudo cp prometheus-2.43.0.linux-amd64/promtool /usr/local/bin/
rm -rf prometheus-2.43.0.linux-amd64.tar.gz prometheus-2.19.0.linux-amd64
sudo cp prometheus.yml /etc/prometheus/prometheus.yml
# nano /etc/prometheus/prometheus.yml
sudo cp prometheus.service /etc/systemd/system/prometheus.service
# nano /etc/systemd/system/prometheus.service
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /var/lib/prometheus
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus
sudo systemctl status prometheus

