# frozen_string_literal: true

# Service Object for Import Update after it was started for Jobs
class ImportStartedUpdateJobService < ApplicationService

  def initialize(import)
    @import = import
  end
  
  def call
    @import.count_of_lines_in_csv = CSV.read(@import.file.path).count - 1
    @import.started_at            = Time.now
    @import.import_status         = 'started'
    @import.save
  end

end
