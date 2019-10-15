require 'rails_helper'

RSpec.describe Import, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  it 'object does not save with null title' do
    # Setup
    import = Import.new
  
    # Exercise        
  
    # Verify
    expect(import.save).to be false
    
    # Cleaning
    import.delete
  end

end

