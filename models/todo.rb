class Todo < ActiveRecord::Base

  def completed?
    self.completed
  end

  def complete!
    @completed = true
  end

end
