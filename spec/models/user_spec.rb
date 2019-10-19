require 'rails_helper'

RSpec.describe User, type: :model do

  it 'object user is not an instance of User and is an instance of CollectionProxy' do  
 
    # Setup          
    import = Import.new(title: 'Import for new Users')
    user   = User.new(first_name: 'Jane')
        
    # Exercise              
    import.users << user
        
    # Verify        
    expect(import.users).not_to be_an_instance_of(User)
    expect(import.users).to be_a(ActiveRecord::Associations::CollectionProxy)
        
    # Cleaning   
  end
  
  
  it 'some clever description' do
    
    # Setup      
    user = User.create
    
    # Exercise          
    
    # Verify    
    expect{user.life_style?}.to raise_error(NoMethodError)
    
    # Cleaning    
  end  
  
  
  it 'user is the content of Import collections' do           
    # Setup      
    import = Import.new(title: 'Import for User including')
    user = User.new(first_name: 'Jenny')
        
    # Exercise          
    import.users << user
        
    # Verify    
    expect(import.users).to include(user)
    
    # Cleaning    
  end  
  
  
  it 'some clever description' do
    
    # Setup      
    user = User.new(date_of_birth: Time.now.year - 99)
        
    # Exercise          
    
    # Verify    
    expect(user).to be_younger_than_100_years
    
    # Cleaning
        
  end  

end























