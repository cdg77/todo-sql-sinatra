require("rspec")
require("pg")
require("list")
require("task")
require('capybara/rspec')
require('./app')


DB = PG.connect({:dbname => "to_do_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end
