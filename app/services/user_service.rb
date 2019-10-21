# frozen_string_literal: true

# Object Service for declaration of new User objects
class UserService < ApplicationService
  def call
    user = User.create do |config|
      config.first_name        = 'User Test'
      config.last_name         = 'Last name'
      config.email             = 'maynard@helleroga.us'
      config.date_of_birth     = '1964-11-03'
      config.import_id         = 4
    end
    user
  end

  def new_with_all_params
    user = User.new do |config|
      config.first_name        = 'User Test'
      config.last_name         = 'Last name'
      config.email             = 'maynard@helleroga.us'
      config.date_of_birth     = '1964-11-03'
      config.import_id         = 4
    end
    user
  end
end
