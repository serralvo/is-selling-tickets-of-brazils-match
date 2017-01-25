shouldSearch=true 
poolingTime=$1

while [ "$shouldSearch" = true ] 
do 
	rm content.txt
	echo "Searching... 🔎 "
	curl -sS http://guicheweb.com.br/selecao >> content.txt	

	if !(grep -q "<h2>VENDAS ON-LINE ENCERRADA.</h2>" content.txt)
	then
		echo "Tickets are available! 🇧🇷"
		shouldSearch=false
		// TODO: Notify! 
	else
		echo "Tickets are not available yet."
	fi

sleep "$poolingTime"
done
