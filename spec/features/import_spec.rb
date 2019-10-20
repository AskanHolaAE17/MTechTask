require 'rails_helper'

RSpec.feature "Imports", type: :feature do

  scenario "User creates a new import" do
    visit "/imports/new"

    fill_in "import_title", with: "Import Test"
    attach_file('public/files/5_users.csv')
    
    click_button "Create Import"

    import = Import.find_by title: "Import Test"
    
    expect(import).to be_truthy
    expect(page).to have_text("Count of successfully created customers")
    
    import.delete
  end
  
  scenario "User deletes an existing import record" do
    import = Import.create(title: "Import Test", file_file_name: "4_users.csv", file_content_type: "text/plain", file_file_size: 234)
    visit "/imports/" + import.id.to_s + '/edit'  

    click_on "Delete Import"

    expect(page).to have_text("Import was successfully destroyed.")      
    
    import.delete
  end  

end
