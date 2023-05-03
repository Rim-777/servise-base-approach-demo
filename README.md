## LET'S MOVE
Ruby-on-Rails [JSON:API](https://jsonapi.org/) application with ActiveRecord, Dry-rb, RSpec

### Overview:
- Demo project for Backend developers at Shypple.B.V. made for knowledge sharing about service based modular application design in Ruby on Rails. 
- The goal of the project is to demonstrate a reliable approach how to build complex but robust and easily scalable and maintainable applications.

### Logic:
Dummy API for searching for cruises.

### Dependencies:
- Ruby 3.2.2
- PostgreSQL

### Installation:
- Clone poject
- Run bundler:

 ```shell
 $ bundle install
 ```
- Copy database.yml:
```shell
$ cp config/database.yml.sample config/database.yml
```

- Create and migrate database:

```shell
 $ bundle exec rails db:create
 $ bundle exec rails db:migrate
```
- Run application:

 ```shell
 $ rails server
 ```

##### Tests:
To execute automation tests, run following commands:

```shell
 $ bundle exec rake db:migrate RAILS_ENV=test #(the first time only)
 $ bundle exec rspec
```

### License

The software is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
