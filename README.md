# OCTOEVENTS WEBAPP

## VERSIONS

- **FRAMEWORK:** Rails V7

- **RUBY:**  3.0.0

- **DB:** MySQL

- **TESTING:**
  + database-cleaner
  + factory_bot
  + faker
  + rspec
  + rubocop

<br/>

## STEPS TO TEST THE WEB APPLICATION

Run the following commands to set the web application environment:

```shell
  bundle install                        # Install gems
  rails db:create && rails db:migrate   # Create database and run the migrations
  rails s                               # Run the server
  rspec .                               # Run the tests
```
<br/>

## ROUTES

| HTTP | Route | Description |
| ----------- | ---- | --------- |
| **POST** | /events | This endpoint will receive the webhook issues information to create a record and also will save the events related to it if the issue has already been created. |
| **GET** | /issues/{issue_number}/events | Will display the events which belongs to the issue which is being searched. |
<br/>

## CONFIGURE NGROK

Run **ngrok** and visit the [localhost:4040](http://localhost:4040) to gain access to the dashboard requests.

```shell
  sudo ngrok http 3000
```

This will open a screen like the following:
```shell
  ngrok by @inconshreveable                                                 (Ctrl+C to quit)
                                                                                            
  Session Status                online                                                      
  Account                       William Romero (Plan: Free)                                 
  Version                       2.3.40                                                      
  Region                        United States (us)                                          
  Web Interface                 http://127.0.0.1:4040                                       
  Forwarding                    http://e850-2800-98-1211-3601-403a-6e57-fbb8-d1f2.ngrok.io -
  Forwarding                    https://e850-2800-98-1211-3601-403a-6e57-fbb8-d1f2.ngrok.io 
                                                                                            
  Connections                   ttl     opn     rt1     rt5     p50     p90                 
                                14      0       0.00    0.00    20.30   23.34               
                                                                                            
  HTTP Requests                                                                             
  -------------
```

Copy the second URL and copy inside Github, following this instructions.

1. On Github > Settings > Webhooks
2. Click on **Add webhook**
3. On *Payload URL* field, insert the Ngrok public endpoint finished by **/events**.

```shell
  https://e850-2800-98-1211-3601-403a-6e57-fbb8-d1f2.ngrok.io/events
```

4. On the **Content type** field, select the option **application/json**.
5. After that, check which actions is needed to trigger on this webapp. In our current project,
   the **issue** events are filtered, what refuses if actions are not related with issues.
6. Check the **Active** checkbox to let the webhook deliver details about the event.
7. Click on **Add webhook**.

**Note:** Each time the Ngrok process is closed, the subdomain of that tool will change, so is
needed to change this address into Github settings webhook page and also inside the project on the
**development.rb** environment file.

```ruby
  # config.hosts << ENV['NGROK_HOST'] if ENV['NGROK_HOST'].present?
  config.hosts << "e850-2800-98-1211-3601-403a-6e57-fbb8-d1f2.ngrok.io"
```
