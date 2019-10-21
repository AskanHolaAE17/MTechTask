# frozen_string_literal: true

# Object Service for declaration of new Import objects
class ImportCreator < ApplicationService
  def call
    Import.create do |config|
      config.title             = 'Import Test'
      config.file_file_name    = '4_users.csv'
      config.file_content_type = 'text/plain'
      config.file_file_size    = 234
    end
  end

  def new_with_all_params
    Import.new do |config|
      config.title             = 'Import Test'
      config.file_file_name    = '4_users.csv'
      config.file_content_type = 'text/plain'
      config.file_file_size    = 234
    end
  end
end
