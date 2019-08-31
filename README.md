# README

This is a simple url shortener built for a coding exersize with a time frame around 2 hours. The application is written using Ruby on Rails version 6.0.0

to run:
1. Clone this repository
2. run `bundle install` then `yarn install` to install dependencies
3. run `rails db:migrate` to setup the dev database
3. run `rails server` to start the server

To test there is a basic test page at the root of the application (Default for me is localhost:3000/) or you can use curl to post a request to `/short_link` for example:

```
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"long_url": "http://www.apple.com"}' \
  http://localhost:3000/short_link
```

All in all, I'm pretty happy with how this turned out being my first rails application. There are a few things I would've liked to do, but didn't fit within the ~2 hour time window:

* unit tests
* ensuring no errors occur from hash collisions (unlikely, but possible)
* building an analytics feature
* building a prettier home page

