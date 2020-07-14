# frozen_string_literal: true

# Service Object for Import Update after it was completed for Jobs
class ImportCompletedUpdateJobService < ApplicationService

  def initialize(import)
    @import = import
  end
  
  def call
    @import.completed_at  = Time.now
    @import.import_status = 'completed'
    @import.percentage = 100
    @import.save
  end

end
