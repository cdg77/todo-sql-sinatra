require('capybara/rspec')
require('./app')
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# describe('/', {:type => :feature}) do
#   it('displays the welcome page') do
#     visit('/')
#     expect(page).to have_content('Welcome To-Do')
#   end
# end
#
# describe('adding a new list', {:type => :feature}) do
#   it('shows the user tasks and details on click') do
#     visit('/')
#     click_link('Add A New List')
#     fill_in('name', :with => 'Fantastic Work!')
#     click_button('Submit')
#     expect(page).to have_content('Success! List added.')
#   end
# end

describe('visiting index to view list of lists', {:type => :feature}) do
  it('displays all lists, containing in this example one list') do
    test_list = List.new({:name => 'headphones', :id => nil})
    test_list.save()
    visit('/')
    expect(page).to have_content('headphones')
  end
end

describe('details for a single list', {:type => :feature}) do
  it('allow a user to click on a list and see the details for it') do
    test_list = List.new({:name => 'Homework', :id => nil})
    test_list.save()
    test_task = Task.new({:description => 'learn SQL', :list_id => test_list.id()})
    test_task.save()

    visit('/')
    click_link(test_list.name())
    expect(page).to have_content(test_task.description())
  end
end

describe('.find') do
  it('returns a list by its ID') do
    test_list = List.new({:name => 'Epicodus stuff', :id => nil})
    test_list.save()
    test_list2 = List.new({:name => 'home stuff', :id => nil})
    test_list2.save()
    expect(List.find(test_list2.id())).to(eq(test_list2))
  end
end
