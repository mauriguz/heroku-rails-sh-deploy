#!/bin/sh

check_if_login() # If whoami fails it means user doesnt have a heroku token
{
  if heroku whoami; then
    return
  fi

  false
}

deploy()
{
  ENV=$1
  echo "${bold}Starting deployment to - $ENV"
  echo "${regular}"
  git push $ENV  master:master
  heroku run rake db:migrate --remote $ENV
}

###
# Main script starts here
###

bold=$(tput bold)
regular=$(tput sgr0)
highlight='\033[0;36m'

echo ""
echo "${bold}DEPLOY SCRIPT - CASAVALOR"
echo "================="
echo "${regular}This script will deploy to the staging AND prod environment, make sure your heroku remotes are named: heroku-staging & heroku-prod"
echo ""
echo "Are you sure you want to continue with the deployment? (y/n): \c"
read SHOULD_CONTINUE

# Check user input
if [ $SHOULD_CONTINUE == "y" ] || [ $SHOULD_CONTINUE == "yes" ]
then
  if check_if_login; then
    deploy heroku-staging
   deploy heroku-prod
  else
    echo "${bold}Login to heroku before moving forward, you can do it using the following command: ${highlight}heroku login"
    echo ""
  fi
fi
