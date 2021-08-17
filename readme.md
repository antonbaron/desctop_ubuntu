# Ubuntu 

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

## Deploy to Heroku

Install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli).

Create a Heroku app:
```bash
heroku create
```

Note the Heroku app name, and add the Heroku Git repository as a remote to this Git repository:
```bash
heroku git:remote -a [heroku-app-name]
```

Set the app's stack to container:
```bash
heroku stack:set container -a [heroku-app-name]
```

Deploy the app:
```bash
git push heroku master
```

Now open the app in your browser:
```bash
heroku open
```
