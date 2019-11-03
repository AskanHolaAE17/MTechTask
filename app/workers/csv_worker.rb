# frozen_string_literal: true

require 'csv'

# Worker for real-time processing of Import from CSV-file
class CsvWorker
  include Sidekiq::Worker
  
  sidekiq_options retry: false

  def perform(import_id)
  
    def make_the_date_valid(row_hash)
      if row_hash['date_of_birth']
        date = row_hash['date_of_birth'].split('/')
        row_hash['date_of_birth'] = date[1] + '/' + date[0] + '/' + date[2]
      end
      row_hash
    end
    
    @import = Import.find(import_id)
      
    ImportStartedUpdateJobService.call(@import)  
      
    users = []  
    row_hash = {}
    result = ''
    
    CSV.foreach(@import.file.path, headers: true).with_index do |row, index|
      row_hash = row.to_h
      row_hash['import_id'] = @import.id
      
      # The day is put on the first place
      # to make the data valid for saving in DB
      row_hash = make_the_date_valid(row_hash)    
      
      user = User.new(row_hash)
      
      if user.valid?
        users << row_hash
        @import.count_of_created_users += 1

      else
        @import.count_of_not_created_users += 1
      end

      @import.percentage = ImportPercentageUpdateJobService.call(@import)
      @import.save if (index % 10).zero? 
      
      if (index % 1000).zero? 
        User.import(users)
        users = []
      end  
    end  
    
    User.import(users)
    ImportCompletedUpdateJobService.call(@import)
    
    puts 
  end
  
  
  
  
  
  
  
  
  
end
