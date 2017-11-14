
require 'rails_helper'

describe "the create task process" do
  it "creates a new task" do
    list = List.create(:name => "Home Stuff")
    visit list_path(list)
    click_link 'Add a task'
    fill_in 'Description', :with => 'New Test Task'
    click_on 'Create Task'
    expect(page).to have_content 'New Test Task'
  end

  it "gives error when no description is entered" do
    list = List.create(:name => 'Home stuff')
    task = Task.create(:description => 'Wash the dishes', :list_id => list.id)
    visit list_path(list)
    click_on 'Add a task'
    fill_in 'Description', :with => ''
    click_button 'Create Task'
    expect(page).to have_content 'Please fix these errors:'
  end
end
