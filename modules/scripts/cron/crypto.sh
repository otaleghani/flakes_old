#!/bin/sh

while getopts "a:b:c:" opt; do
	case $opt in
		a) api_key="$OPTARG" ;;
		b) symbol="$OPTARG" ;;
		c) convertion="$OPTARG" ;;
		\?) echo "ERR. Invalid option -$OPTARG" >&2 ;;
	esac
done

filename="$symbol-$convertion.json"
foldername="$HOME/.crypto_prices"

if [ ! -d "$foldername" ]; then
	mkdir -p "$foldername"
fi

response=$(curl -H "X-CMC_PRO_API_KEY: $api_key" -H "Accept: application/json" -d "convert=$convertion&symbol=$symbol" -s -G https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest)

response_status=$(echo $response | jq ".status.error_code")

echo "$response_status"
if [ "$response_status" -eq 0 ]; then
	echo $response > "$foldername/$filename" ; exit
fi

error_message=$(echo $response | jq ".status.error_message")
echo "Not a valid request.\n\n Error message: $error_message"
