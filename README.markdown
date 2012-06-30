# My Answer to Vzaar's coding test

A fun little coding test i got sent by Vzaar. I enjoyed it very much

## Required 3rd party apps
* Mysql server - (easiest way is *brew install mysql*)
* bundle - *gem install bundle*

## How to test
Tests are built with rspec / capybara so run:
<pre><code>rake spec</code></pre>
Some tests are for js and so require firefox.



## How to deploy
1. git clone git@github.com:elachys/vzaar-test.git
2. cd vzaar-test
3. bundle install
4. rake db:create
5. rake db:migrate
6. rails server

7. Then go to http://localhost:3000