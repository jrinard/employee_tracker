require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add new division form path', {:type => :feature}) do
  it "allow the user to access the  create a division form" do
    visit('/')
    click_link('Add New Division')
    expect(page).to have_content('Add New Division')
  end

end

describe('add new division path', {:type => :feature}) do
  it "allow the user to create a division" do
  visit('/')
  click_link('Add New Division')
  fill_in('name', :with => "Rob Corp")
  click_button("Save")
  expect(page).to have_content("Rob")
  end
end

describe('seeing details for a single division', {:type => :feature}) do
  it('allows a user to click a division to see the details for it') do
    div = Division.create({:name => 'Sales'})
    visit('/divisions')
    click_link(div.name())
    expect(page).to have_content("Sales")
  end
end


describe('update division path', {:type => :feature}) do
  it('allows a user to update a division') do
    div = Division.create({:name => 'HR'})
    visit('/divisions')
    click_link("- Update")
    fill_in('name', :with => "Outside Sales")
    click_button("Update")
    expect(page).to have_content("Outside")
  end
end
