# frozen_string_literal: true

# Validations and Testing methods for User model
class User < ApplicationRecord
  belongs_to :import

  validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :last_name, presence: true,  length: { minimum: 2, maximum: 100 }
  validates :email, presence: true,      length: { maximum: 100 },
                    format: { with: /.+@.+\..+/ }

  validates :date_of_birth, presence: true
  validates :date_of_birth, date: { after: proc { Time.now - 100.years },
                                    before: proc { Time.now - 18.years } }

  # Methods for Testing

  def younger_than_100_years?
    date_of_birth.year > Time.now.year - 100
  end
end
