class TodoList
  def initialize
    @list = []
  end

  def add(todo) # todo is an instance of Todo
    @list << todo
  end

  def incomplete
    incomplete_list = []
    @list.each do |task|
      if task.done? == false
        incomplete_list << task
      end
    end
    return incomplete_list
  end

  def complete
    complete_list = []
    @list.each do |task|
      if task.done? == true
        complete_list << task
      end
    end
    return complete_list
  end

  def give_up!
    @list.each do |task|
      task.mark_done!
    end
  end
end