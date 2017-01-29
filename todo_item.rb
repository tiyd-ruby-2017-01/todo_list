class TodoItem
  attr_accessor :description, :done

  def initialize(description)
    @description = description
    @done = false
  end

  def to_s
    @description + ' - ' + (@done ? '' : 'not ') + 'done'
  end
end
