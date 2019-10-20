require 'rails_helper'

RSpec.describe ImportsController, type: :controller do

  it "assigns a blank import to the view" do
    get :new
    expect(assigns(:import)).to be_a_new(Import)
  end
    
  it 'validate the type of title field' do
    import = Import.new(title: 'Import Test')
    is_field_is_string_type = import.title.instance_of?(String)
    
    expect(is_field_is_string_type).to be true
  end    

end
