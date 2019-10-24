crtsh(){
	curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u
}

sublist3r(){
        python3 ~/Desktop/tools/Sublist3r/sublist3r.py -d $1 -o $1_domains.txt
}

runlive(){
	cat $1 | httprobe > $HOME/Recon/$1/$1_live.txt
}

rununiq(){
	cat $HOME/Recon/$1/$1_live.txt $HOME/aquatone/$1/urls.txt | uniq > $HOME/Recon/$1/final_urls.txt
}

cleanhttps(){
	cat $HOME/Recon/$1/final_urls.txt |sed 's/https\?:\/\///' > $HOME/Recon/$1/url.txt
}

runnmap(){
	nmap -iL $HOME/Recon/$1/url.txt -Pn -n -sn -oG openport.txt
}

runhost(){
cat $HOME/Recon/$1/openport.txt | grep ^Host | cut -d " " -f 2 > $HOME/Recon/$1/host.txt
}

runmasscan(){
	sudo masscan -iL host.txt -p 0-65535  -oX $HOME/Recon/$1/mass_output.xml --max-rate 100000
}

runaquatone(){
	cat $HOME/Recon/$1/mass_output.xml | aquatone -out $HOME/Recon/$1/
}

rundirsearch(){
	python3 $HOME/dirsearch/dirsearch.py -L $HOME/Recon/$1/final_urls.txt -e * --plain-text-report=$HOME/Recon/$1/dirsearch.txt
}