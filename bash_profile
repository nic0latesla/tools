recon(){
  mkdir -p $HOME/Recon/$1
  python3 $HOME/tools/Sublist3r/sublist3r.py -d $1 -o $HOME/Recon/$1/domains.txt
  cat $HOME/Recon/$1/domains.txt | httprobe > $HOME/Recon/$1/live.txt
  cat $HOME/Recon/$1/live.txt |sed 's/https\?:\/\///' | sort -u > $HOME/Recon/$1/final_url.txt
  nmap -iL $HOME/Recon/$1/final_url.txt -Pn -n -sn -oG $HOME/Recon/$1/openport.txt
  cat $HOME/Recon/$1/openport.txt | grep ^Host | cut -d " " -f 2 | sort -u > $HOME/Recon/$1/host.txt
  masscan -iL $HOME/Recon/$1/host.txt -p80,8080,443,445,21,22,25,587,3306,3389,2082,2083,2086,2087,2095,2096,2077,2078 -oX $HOME/Recon/$1/mass_output.xml --max-rate 100000
  cat $HOME/Recon/$1/mass_output.xml | aquatone -out $HOME/Recon/$1/report
  #python3 $HOME/tools/dirsearch/dirsearch.py -L $HOME/Recon/$1/live.txt -e * --plain-text-report=$HOME/Recon/$1/dirsearch.txt
}

crtsh(){
   curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u
}

sublist3r(){
        python3 ~/Desktop/tools/Sublist3r/sublist3r.py -d $1 -o domains.txt
}

runlive(){
	cat domains.txt | httprobe > live.txt
}

cleanhttps(){
	cat live.txt |sed 's/https\?:\/\///' | sort -u  > final_url.txt
}

runnmap(){
	nmap -iL final_url.txt -Pn -n -sn -oG openport.txt
}

runhost(){
	cat openport.txt | grep ^Host | cut -d " " -f 2 | sort -u > host.txt
}

runmasscan(){
	masscan -iL host.txt -p80,8080,443,445,21,22,25,587,3306,3389,2082,2083,2086,2087,2095,2096,2077,2078  -oX mass_output.xml --max-rate 100000
}

runaquatone(){
	cat mass_output.xml | aquatone -out report
}

rundirsearch(){
	python3 ~/Desktop/tools/dirsearch/dirsearch.py -L live.txt -e html,shtml,js,json,txt,bak,rar,zip --plain-text-report=dirsearch.txt
}


export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

