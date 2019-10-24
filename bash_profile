crtsh(){
   curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u
}

sublist3r(){
        python3 ~/Desktop/tools/Sublist3r/sublist3r.py -d $1 -o $1_domains.txt
}

runlive(){
	cat $1 | httprobe > $1_live.txt
}

rununiq(){
	cat $HOME/Recon/$1/$1_live.txt $HOME/aquatone/$1/urls.txt | uniq > $HOME/Recon/$1/final_urls.txt
}

cleanhttps(){
	cat $1 |sed 's/https\?:\/\///' > url.txt
}

runnmap(){
	nmap -iL $1 -Pn -n -sn -oG openport.txt
}

runhost(){
	cat openport.txt | grep ^Host | cut -d " " -f 2 > host.txt
}

runmasscan(){
	masscan -iL host.txt -p 0-65535  -oX mass_output.xml --max-rate 100000
}

runaquatone(){
	cat mass_output.xml | aquatone -out report
}

rundirsearch(){
	python3 ~/Desktop/tools/dirsearch/dirsearch.py -L final_urls.txt -e * --plain-text-report=dirsearch.txt
}