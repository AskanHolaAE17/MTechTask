# frozen_string_literal: true

class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end

  def self.new_with_all_params(*args, &block)
    new(*args, &block).new_with_all_params
  end

  def self.update_after_started(*args, &block)
    new(*args, &block).update_after_started
  end

  def self.update_after_completed(*args, &block)
    new(*args, &block).update_after_completed
  end
end
