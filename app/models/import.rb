class Import < ApplicationRecord

  has_many :users

  validates :title, presence: { message: ' should be filled' }
  validates :title, length:   { maximum:   200, 
                                too_long: '200 characters is the maximum allowed' }
  
  has_attached_file :file
  validates_attachment_size :file, less_than: 10.megabytes
  validates_attachment_presence :file
  do_not_validate_attachment_file_type :file  

end
