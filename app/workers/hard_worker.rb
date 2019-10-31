class HardWorker
  include Sidekiq::Worker
  
  # sidekiq_options retry: false

  def perform(message)
    user = User.last
    user.first_name = 'Queue3'    
    user.save
    
    # puts user.save
    # puts message
  end
end
