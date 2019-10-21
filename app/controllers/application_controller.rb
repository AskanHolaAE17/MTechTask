# frozen_string_literal: true

# Helper methods for using in any controllers
class ApplicationController < ActionController::Base
  helper_method :make_the_date_valid

  def make_the_date_valid(row_hash)
    if row_hash['date_of_birth']
      date = row_hash['date_of_birth'].split('/')
      row_hash['date_of_birth'] = date[1] + '/' + date[0] + '/' + date[2]
    end
    row_hash
  end
end
