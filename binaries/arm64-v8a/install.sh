BINARIES="
bash-arm64
coreutils-arm64
curl-arm64
htop-arm64
iperf-3.17.1
iw-arm64
nano-arm64
ncat-arm64
nethogs-arm64
nmap-arm64
nping-arm64
openssl-arm64
rsync-arm64
tcpdump-arm64
vim-arm64
zip-arm64
zsh-arm64"

where=$(dirname $0)
cd "$where"
mv .bashrc ..

for f in $BINARIES; do 
	name=$(echo "$f" | sed 's/-.*//g')
	ln -snf $f $name 
	chmod a+x $f $name 
done 
ln -snf vim-arm64 vi 

cd - 


