# frozen_string_literal: true

# Object Service for Import updating
class ImportDataUpdater < ApplicationService
  def initialize(import)
    @import = import
  end

  def update_after_started
    @import.count_of_lines_in_csv = CSV.read(@import.file.path).count - 1
    @import.started_at            = Time.now
    @import.import_status         = 'started'
    @import.save
  end

  def update_after_completed
    @import.completed_at  = Time.now
    @import.import_status = 'completed'
    @import.save
  end
end
