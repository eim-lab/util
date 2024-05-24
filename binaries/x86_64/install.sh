BINARIES="
bash-x64
coreutils-x64
curl-x64
htop-x64
iperf-3.17.1
iw-x64
nano-x64
ncat-x64
nethogs-x64
nmap-x64
nping-x64
openssl-x64
rsync-x64
tcpdump-x64
vim-x64
zip-x64
zsh-x64"

where=$(dirname $0)
cd "$where"
mv .bashrc ..

for f in $BINARIES; do 
	name=$(echo "$f" | sed 's/-.*//g')
	ln -snf $f $name 
	chmod a+x $f $name 
done 
ln -snf vim-x64 vi 

cd - 


