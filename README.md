# OCTOEVENTS WEBAPP

## VERSIONS

- **Framework:** Rails V7

- **Ruby:**  3.0.0

- **Database:** MySQL

- **Testing:** rspec 

<br/>

## STEPS TO TEST THE WEB APPLICATION

Run the following commands to set the web application environment:

```shell
  bundle install                        # Install gems
  rails db:create && rails db:migrate   # Create database and run the migrations
  rails s                               # Run the server
  rspec .                               # Run the tests
```

## CONFIGURE NGROK

Run **ngrok** and visit the [localhost:4040](http://localhost:4040) to gain access to the dashboard requests.

```shell
  sudo ngrok http 3000
```
