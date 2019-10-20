class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
  
  def self.new_with_all_params(*args, &block)
    new(*args, &block).call
  end  
end
