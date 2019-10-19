require 'rails_helper'

RSpec.describe Import, type: :model do

  # Format:
    # Setup      
    # Exercise          
    # Verify    
    # Cleaning
  
  it 'object does not save with null title' do
    # Setup
    import = Import.new
  
    # Exercise        
  
    # Verify
    expect(import.save).to be false
    
    # Cleaning
  end  

end

