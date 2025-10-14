dpkg -V vim
dpkg -V
dpkg -l
dpkg -l vim
dpkg -l wget
dpkg -l htop
dpkg -l atop
dpkg -L vim
man dpkg 
dpkg -L vim
dpkg -S /usr/share/lintian
dpkg -S /usr/bin/vim.basic
dpkg -s vim
dpkg -I webfs_1.21+ds1-8_amd64.deb
dpkg -l vim
dpkg -s vim
dpkg -S /etc/vim/vimrc.tiny 
dpkg -S /etc/network/if-up.d/ethtool 
cat /etc/netplan/50-cloud-init.yaml 
dpkg -S /etc/netplan/50-cloud-init.yaml 
dpkg -l netplan
dpkg -L netplan
cat /etc/netplan/50-cloud-init.yaml 
cat /etc/logrotate.conf 
dpkg -S logrotate.conf
dpkg -S /etc/logrotate.conf 
dpkg -s logrotate
dpkg -S logrotate
dpkg -l logrotate
dpkg -Ñ logrotate
dpkg -L logrotate
dpkg -V logrotate
cp /etc/logrotate.conf .
vim /etc/logrotate.conf 
dpkg -V logrotate
cp logrotate.conf /etc/logrotate.conf 
dpkg -V logrotate
rpkg -r logrotate
systemctl -t service
dpkg -S /etc/apt/sources.list
ls -al /etc/apt/sources.list.d
ls -al /etc/apt/sources.list
apt install dpkg-query
dpkg -S /etc/apt/sources.list
dpkg -l apt-file
apt install apt-file
dpkg -L apt-file
apt-file update
apt install git*
apt install git
exit
apt update
ip a
exit
ping www.google.com
ip a
cat /etc/os-release 
cat /etc/netplan/
cat /etc/netplan/50-cloud-init.yaml 
shutdown -h now
apt install nala
ls
nala upgrade
apt -y upgrade
apt update && apt -y upgrade
sudo sed -i 's|http://security.ubuntu.com|http://archive.ubuntu.com|g' /etc/apt/sources.list
apt update && apt -y upgrade
apt-get update --fix-missing
apt update && apt -y upgrade
cp /etc/apt/sources.list{
cp /etc/apt/sources.list{,.org}
vim /etc/apt/sources.list
apt update && apt -y upgrade
vim /etc/apt/sources.list
cat /etc/apt/sources.list
apt update && apt -y upgrade
cat /etc/apt/sources.list
exit
apt update
ip a
apt -y upgrade
apt update
vim
htop
df -h
slbl
lsblk 
systemctl -t service
sudo shutdown -h now
hostname set-hostname srv1-lab1
hostnamectl set-hostname web-srv1-lab1
vim /etc/netplan/50-cloud-init.yaml 
netplan apply 
ip a
reboot 
cat /etc/os-release 
systemctl -t service
ip a
vim /etc/netplan/50-cloud-init.yaml 
ip a
netplan apply 
ip a
vim /etc/hosts
reboot 
vim /etc/netplan/01-init.yaml /etc/netplan/01-netcfg.yaml
mv -v /etc/netplan/01-init.yaml /etc/netplan/01-netcfg.yaml
vim /etc/netplan/01-netcfg.yaml 
netplan apply; exit
ip a
systemctl status
systemctl -t service
vim /etc/netplan/50-cloud-init.yaml 
netplan apply 
xit
exit
mkdir lfcs-labs-set-i
cd lfcs-labs-set-i/
mkdir collector
cd collector/
vim collector1.sh
vim collector2.sh 
vim collector1.sh 
vim collector3.sh
tmux
vim
chmod 755 collector*
ls -al
vim lanza-escenario.sh
vim README.md
cd
exit
cp /etc/nginx/nginx.conf{,.org}
cat /etc/os-release 
cp /etc/nginx/sites-available/default{,.org}
vim /etc/nginx/sites-available/default
systemctl reload nginx
vim /etc/nginx/sites-available/web-srv1-2222.conf
cp /etc/nginx/sites-available/web-srv1-{2222,1111}.conf 
vim /etc/nginx/sites-available/web-srv1-1111.conf 
cat /etc/nginx/sites-available/web-srv1-1111.conf 
mkdir -pv /var/www/web-srv1-{1111,2222} 
vim /var/www/web-srv1-1111/index.html
cp /var/www/web-srv1-1111/index.html /var/www/web-srv1-2222/
vim /var/www/web-srv1-2222/index.html 
systemctl reload nginx
cd /etc/nginx/sites-enabled/
ls -l
ln -s ../sites-available/web-srv1-1111.conf .
ln -s ../sites-available/web-srv1-2222.conf .
ls -l
nginx -t 
nginx -t /etc/nginx/sites-available/web-srv1-1111.conf 
man nginx
nginx -t /etc/nginx/nginx.conf
man nginx
nginx -t -e /etc/nginx/nginx.conf
nginx -t -e /etc/nginx/sites-available/web-srv1-*
nginx -t -e /etc/nginx/sites-available/web-srv1-1111.conf 
nginx -t -e /etc/nginx/sites-available/web-srv1-2222.conf 
systemctl reload nginx
exit
cd /etc/nginx/
ls -al
cd sites-available/
ls -al
mv web-srv1-1111.conf app1
mv app2
mv web-srv1-2222.conf app2
cd ..
cd sites-enabled/
ls -al
rm web-srv1-* -v
ln -s ../sites-available/app1 .
ln -s ../sites-available/app2 .
ls -al
cd ..
cd sites-available/
vim app1
cat app2 
cat app1 
cp app1 app2 
vim app2 
systemctl reload nginx
ls -al
rm -rfv /var/www/web-srv1-1111/index.html 
rm -rfv /var/www/web-srv1-1111
rm -rfv /var/www/web-srv1-2222
ip a
vim /etc/hosts
cat /etc/hosts
useradd -m -d /home/jackie -s /bin/bash jackie
usermod -G operators -a jackie
groupadd operators
usermod -G operators -a jackie
id jackie 
passwd jackie 
cat /etc/hosts
shutdown -h now
su - jackie
exit
cat /etc/systemd/timesyncd.conf 
exit
ls -al
cd lfcs-labs-set-i/
ls -al
cd collector/
ls -al
cat lanza-escenario.sh 
rm lanza-escenario.sh 
chmod 755 collector* -v
vim lanza-escenario.sh
chmod 755 lanza-escenario.sh 
ps aux|grep collect
./lanza-escenario.sh 
ps aux|grep collect
ls -al
ps auxw|grep coll
kill 2831
ls -al
jobs
cat 
ps auxw|grep sleep
ps auxw
ps auxwf
ps auxwf |less
reboot 
cd lfcs-labs-set-i/
ls -al
cd collector/
ls -al
cd ..
mv collector question-13-lanza-escenario
cd question-13-lanza-escenario/
ls -al
mv collector1.sh collector1.sh-beta1
mv collector2.sh collector2.sh-beta2
mv collector3.sh collector3.sh-beta3
mkdir escenario-aistudio
cd escenario-aistudio/
vim collector1.sh
vim collector2.sh 
vim collector3.sh 
ls -al
chmod 755 collector*
ls -al
cd ..
ls -al
mkdir escenario-claude.ia
mv collector1.sh-beta1 collector2.sh-beta2 collector3.sh-beta3 lanza-escenario.sh escenario-claude.ia/
cat README.md 
mv README.md escenario-claude.ia/
cd escenario-
cd escenario-claude.ia/
ls -al
mv collector1.sh-beta1 collector1.sh 
mv collector2.sh-beta2 collector2.sh
mv collector3.sh-beta3 collector3.sh
ls -al
cd ..
mv escenario-claude.ia claure.ia
mv escenario-aistudio aistudio
ls -al
cd
shutdown -h now
ip a
exit
cat /etc/timezone 
timedatectl set-timezone Europe/Madrid
cat /etc/timezone 
timedatectl list-timezones 
cat /proc/sys/net/ipv4/ip_forward
cat /etc/timezone 
exit
vim /etc/systemd/timesyncd.conf 
systemd-analyze cat-config systemd/timesyncd.conf
man timesyncd.conf
vim /etc/systemd/timesyncd.conf 
systemctl restart systemd-timesyncd.service 
vim /etc/systemd/timesyncd.conf 
systemctl restart systemd-timesyncd.service 
systemctl -t service
systemctl status systemd-timesyncd.service 
vim /etc/systemd/timesyncd.conf 
man timesyncd.conf
systemctl status systemd-timesyncd.service 
systemctl restart systemd-timesyncd.service 
systemctl status systemd-timesyncd.service 
vim /etc/systemd/timesyncd.conf 
systemctl restart systemd-timesyncd.service 
systemctl status systemd-timesyncd.service 
vim /etc/systemd/timesyncd.conf 
systemctl restart systemd-timesyncd.service 
systemctl status systemd-timesyncd.service 
vim /etc/systemd/timesyncd.conf 
systemctl restart systemd-timesyncd.service 
systemctl status systemd-timesyncd.service 
vim /etc/systemd/timesyncd.conf 
systemctl status systemd-timesyncd.service 
systemctl reload systemd-timesyncd.service 
systemctl restart systemd-timesyncd.service 
systemctl status systemd-timesyncd.service 
apt install ntpdate
timedatectl timesync-status 
#3320m i5 intel core ddr3
#one 562 positivo BGH
timedatectl timesync-status 
exit
cd ~jackie/
cat .bash
cat .bashrc 
man ulimit 
ulimit -u jackie -a
ulimit -u dzamo -a
ulimit -u dzamo -a| tee /root/dzamo
ulimit -u jackie -a| tee /root/jackie
cd
diff dzamo jackie 
su - jackie 
ulimit -a
vim /etc/security/limits.conf 
su - jackie
vim /etc/security/limits.conf 
exit
useradd -m -d /home/user1 -s /bin/bash -G operators user1
id user1
exit
passwd user1
vim /etc/security/limits.
vim /etc/security/limits.conf 
exit
ip a
exit
shutdown -h now
cat /home/jackie/.bash
cat /home/jackie/.bashrc 
su - jackie
vim /etc/security/limits.conf 
exit
ls -l
./lanza-escenario.sh 
cat lanza-escenario.sh 
ps auxw|grep collector3.
jobs
shutdown -r 2
exit
ps auxw|grep -i 'collect'
ps auxw|grep -i 'coll'
ps auxw|less
ps auxw|grep -i r3
ps auxw|grep -i 'llec'
watch "ps auxw|grep -i 'llec'"
htop
top -i
top
w
less collector3.sh 
ps auxw|grep -i 'llec'
kill -9 10528
exit
ls -l
cd lfcs-labs-set-i/
ls -al
cd question-13-lanza-escenario/
ls -al
cd claure.ia/
ls -al
cat lanza-escenario.sh 
tmux
exit
cat lanza-escenario.sh 
exit
./collector1.sh 
cd ..
ls -l
cd question-13-lanza-escenario/aistudio/
ls -al
./collector2.sh 
vim collector2.sh 
./collector2.sh 
vim collector2.sh 
> collector2.sh 
vim collector2.sh 
./collector2.sh 
history 
./collector2.sh 
ls -l
cd lfcs-labs-set-i/question-13-lanza-escenario/
ls -al
mv claure.ia claude.io
cd claude.io/
ls -al
cat lanza-escenario.sh 
tmux
pwd
tmux
./collector2.sh 
cd ..
cd aistudio/
./collector1.sh 
./collector3.sh 
cd ..
cd aistudio/
./collector3.sh 
ps auxw|grep ollect
cd ..
cd aistudio/
ls -al
less collector3.sh 
ps auxw|grep collector2
kill -9 2636
ps auxw|grep ollect
man strace
strace -p 1347
ps auxw|grep ollect
strace -p 1347 -e trace=kill > /tmp/collector2.sh.log 2>&1 &
strace -p 1414 -e trace=kill > /tmp/collector1.sh.log 2>&1 &
strace -p 1467 -e trace=kill > /tmp/collector3.sh.log 2>&1 &
tail -f /tmp/collector*.sh.log
history 
tail -f /tmp/collector*.sh.log
tail -f /tmp/collector*.sh.log|grep -i "kill"
cd lfcs-labs-set-i/ai
cd lfcs-labs-set-i/question-13-lanza-escenario/aistudio/
ls -al
grep kill *
cat collector2.sh 
tail -f /tmp/collector*.sh.log|grep -i "kill"
ps auxw|grep strace
ps auxw|grep collector
strace -p 1414 -e trace=kill > /tmp/collector11.sh.log 2>&1 &
strace -p 2636 -e trace=kill > /tmp/collector22.sh.log 2>&1 &
strace -p 2640 -e trace=kill > /tmp/collector33.sh.log 2>&1 &
> /tmp/collector1.sh.log 
> /tmp/collector2.sh.log 
> /tmp/collector3.sh.log 
tail -f /tmp/collector*.log |grep -i 'kill'
tail -f /tmp/collector11.sh.log 
tail -f /tmp/collector22.sh.log 
tail -f /tmp/collector33.sh.log 
tail -f /tmp/collector*.log |grep -i 'kill'
man strace 
tail -f /tmp/collector* 
tail -f /tmp/collector* |grep -i kill
tail -f /tmp/collector* |grep -iB 5 kill
tail -f /tmp/collector22.sh.log 
shutdown -r now
