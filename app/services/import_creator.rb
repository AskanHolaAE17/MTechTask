# frozen_string_literal: true

class ImportCreator < ApplicationService
  def call
    import = Import.create do |config|
      config.title             = 'Import Test'
      config.file_file_name    = '4_users.csv'
      config.file_content_type = 'text/plain'
      config.file_file_size    = 234
    end
  end

  def new_with_all_params
    import = Import.new do |config|
      config.title             = 'Import Test'
      config.file_file_name    = '4_users.csv'
      config.file_content_type = 'text/plain'
      config.file_file_size    = 234
    end
  end
end
