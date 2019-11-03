# frozen_string_literal: true

# Service Object for Import progress in percentage Update for Jobs
class ImportPercentageUpdateJobService < ApplicationService

  def initialize(import)
    @import = import
  end
  
  def call
    @import.percentage = if @import.count_of_lines_in_csv.positive?
                           (@import.count_of_created_users +
                            @import.count_of_not_created_users).to_f /
                             @import.count_of_lines_in_csv *
                             100
                         end

    @import.percentage.to_i  
  end

end
