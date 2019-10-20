require 'rails_helper'

RSpec.describe "Imports", type: :request do

  describe "GET #new" do
  
    it "render form partial on Import new page" do
      get "/imports/new"
      
      expect(response).to render_template(:new)
      expect(response).to render_template('_form')
    end
    

    it "creates an Import and redirects to the Edit page" do
      import = ImportCreator.call
      get edit_import_path(import.id)
      
      expect(response).to be_successful
      expect(response.body).to include('Count of successfully created customers') 
      
      import.delete
    end    
  
  end
  
  describe "GET #show" do
    it "returns a 200 custom status code" do
      import = ImportCreator.call
      get import_path(import)
      
      expect(response).to have_http_status(200)
      
      import.delete
    end
  end  
  
end
