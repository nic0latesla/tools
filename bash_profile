init(){
    echo "Installing Golang"
    wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz
    tar -xvf go1.12.7.linux-amd64.tar.gz
    mv go /usr/local
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
    echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
    echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
    echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
    source ~/.bash_profile
    echo "done"
    sleep 1

    #create a tools folder in ~/
    mkdir ~/tools
    cd ~/tools/

    echo "installing pip"
    apt install python-pip
    echo "done"
    sleep 1

    echo "installing Sublist3r"
    git clone https://github.com/aboul3la/Sublist3r.git
    cd Sublist3r*
    pip install -r requirements.txt
    echo "done"

    echo "installing dirsearch"
    git clone https://github.com/maurosoria/dirsearch.git
    echo "done"

    #install aquatone
    echo "Installing Aquatone"
    go get github.com/michenriksen/aquatone
    echo "done"

    echo "installing httprobe"
    go get -u github.com/tomnomnom/httprobe 
    echo "done"
}

recon(){
  mkdir -p $HOME/Recon/$1
  python $HOME/tools/Sublist3r/sublist3r.py -d $1 -o $HOME/Recon/$1/domains.txt
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

rundirsearch(){
	python3 ~/Desktop/tools/dirsearch/dirsearch.py -L live.txt -e html,shtml,js,json,txt,bak,rar,zip --plain-text-report=dirsearch.txt
}

hostlive(){
	for site in $(cat subdomains.txt);do curl -s -o /dev/null -I -w "%{http_code}" https://$site --max-time 5; printf " - $site \n" & done > responses.txt
}

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

