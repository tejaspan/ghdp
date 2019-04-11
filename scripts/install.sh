#installing packages
service iptables stop
file=/etc/ssh/sshd_config
cp -p $file $file.old && awk ' $1=="PermitRootLogin" {$2="yes"} $1=="PasswordAuthentication" {$2="yes"} $1=="#PubkeyAuthentication" {$1="PubkeyAuthentication"} {print} ' $file.old > $file
service sshd restart
sed -i '/SELINUX/ s/enforcing/disabled/' /etc/sysconfig/selinux
echo "root" | passwd --stdin root
echo never > /sys/kernel/mm/transparent_hugepage/enabled
