class User < ApplicationRecord

  belongs_to :import
  
  validates :first_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :last_name, presence: true,  length: { minimum: 2, maximum: 100 }
  validates :email, presence: true,      length: { maximum: 100 }, format: { with: /.+@.+\..+/}
  
  validates :date_of_birth, presence: true
  validates :date_of_birth, date: {after:  Proc.new { Time.now - 100.years },
                                   before: Proc.new { Time.now - 18.years } }

end
