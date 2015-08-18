require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('/', {:type => :feature}) do
  it('displays the welcome page') do
    visit('/')
    expect(page).to have_content('Welcome To-Do')
  end
end

describe('adding a new list', {:type => :feature}) do
  it('shows the user tasks and details on click') do
    visit('/')
    click_link('Add A New List')
    fill_in('name', :with => 'Fantastic Work!')
    click_button('Add a List')
    expect(page).to have_content('Success!')
  end
end
