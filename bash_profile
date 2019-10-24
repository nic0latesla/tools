crtsh(){
	curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u
}

runnmap(){
	nmap -iL $HOME/Recon/$1/url.txt -Pn -n -sn -oG name_file.txt
}
