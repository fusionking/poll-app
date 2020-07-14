# Poll App

An application which runs on Ruby on Rails framework, in which users can create Polls with either multiple choice questions, open ended questions or both.
The users are also able to respond on the polls, and each users response is stored to be analyzed.

The Ruby version is: **2.5.0**
You may have to run the command ```rvm use ruby-2.5.0``` if you have multiple ruby installations on your system.

***
### How to run the application
You can build & run the application via these set of commands:
```
# To install all gem dependencies
bundle install
# To reflect all the defined tables to the database
rails db:migrate
# To kickstart the server (default port: 3000)
rails server
```

### How to run the tests
You can run the tests with coverage via:

```
# Runs the test suite
rails test
# To view the coverage report
open coverage/index.html
```
The current coverage is %100.

### Third Party Gems
- simplecov is used to generate coverage reports from the tests run
- bootstrap_form is used to render simple bootstrap forms from models.
- rails-controller-testing is used to test controller specific behaviour.
