# heroku-rails-sh-deploy

### What is it?

Dead simple script to deploy a rails app to heroku using staging and prod as different environments

### How to use it?

1. First of all you need to have heroku-cli installed.
2. Rename your heroku remotes in git to _heroku-staging_ and _heroku-prod_

### What's the benefit of this script?

If your project doesn't have continuous deployment set up, this could be a simple replacement. The goal of the script is to automatically run the push to heroku and apply migrations.

## Disclaimer

The intent of this script is to be as simple as possible, hence it's functionality is quite short. Because of that this might not be a fit for your project, if that's the case you might want to take a look at [this repo](https://github.com/gma/heroku-deploy-rails), it provides more functionality and could be a better fit for you.
You're free to clone this repo and add as much functionality as you want, you can keep your version as a fork or feel free to create a PR and together make this script better!

