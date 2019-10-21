# frozen_string_literal: true

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

  it 'checking an unexisted field' do
    # Setup
    user = User.new

    # Exercise

    # Verify
    expect { user.life_style? }.to raise_error(NoMethodError)

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

  it 'user is younger than 100 years' do
    # Setup
    user = User.new(date_of_birth: Time.now.year - 99)

    # Exercise

    # Verify
    expect(user).to be_younger_than_100_years

    # Cleaning
  end

  it 'belongs to Import' do
    should belong_to(:import)
  end

  it 'is not valid without a first_name' do
    user = UserService.new_with_all_params
    user.first_name = nil

    expect(user).to_not be_valid
  end
end
