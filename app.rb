require('sinatra')
require('sinatra/reloader')
require('./lib/task')
require('./lib/list')
require('pg')
also_reload('lib/**/*.rb')

# DB = PG.connect({:dbname => "to_do_test"})

get('/') do
  @lists = List.all()
  erb(:index)
end

get('/lists/new') do
  erb(:list_form)
end

post('/lists') do
  name = params.fetch('name')
  list = List.new({:name => name, :id => nil})
  list.save()
  erb(:list_success)
end
