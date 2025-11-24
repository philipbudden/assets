#!/bin/sh
azurite --blobHost 0.0.0.0 --blobPort 10000 --location /data/blob --silent &
AZURITE_PID=$!
sleep 5

# Connection string for dev account
CONN="DefaultEndpointsProtocol=http;AccountName=devstoreaccount1;AccountKey=Eby8vdM02xNOcqFlqUwJPLlmEtlCDXJ1OUzFT50uSRZ6IFsuFq2UVErCz4I6tq/K1SZFPTOtr/KBHBeksoGMGw==;BlobEndpoint=http://127.0.0.1:10000/devstoreaccount1;"

# Create the 'person' container and populate CSV's
az storage container create --name person --connection-string "$CONN"
for f in /init-data/*.csv; do
  az storage blob upload --container-name person --file "$f" --name "$(basename "$f")" --connection-string "$CONN"
done

# Keep Azurite running
wait $AZURITE_PID
