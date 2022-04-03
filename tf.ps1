# Required module:
# Install-Module -Name dotenv
. .\Set-PsEnv.ps1
Set-PsEnv

docker run --rm -it `
    -e "OS_USERNAME=$env:ENV_BACKEND_USERNAME" `
    -e "OS_PASSWORD=$env:ENV_BACKEND_PASSWORD" `
    -e "OVH_APPLICATION_KEY=$env:ENV_OVH_APPLICATION_KEY" `
    -e "OVH_APPLICATION_SECRET=$env:ENV_OVH_APPLICATION_SECRET" `
    -e "OVH_CONSUMER_KEY=$env:ENV_OVH_CONSUMER_KEY" `
    -v "${PWD}:/data" `
    -w /data `
    hashicorp/terraform:1.1.7 "$($args -join " ")"
