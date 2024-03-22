env=$1
action=$2

if [ -z "$env" ]; then
    echo "please enter the env values from [dev|prod]"
    exit 1
fi

if [ -z "$action" ]; then
    echo "please enter the actions"
    exit 1
fi

rm -rf .terraform/terraform.tfstate
terraform init -backend-config=env-$env/state.tfvars
terraform $action -var-file=env-$env/main.tfvars