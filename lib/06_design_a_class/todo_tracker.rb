class TodoTracker
  def initialize
    @todo_list = []
  end

  def add(todo)
    fail "Error, Todo already in Todo list" unless !@todo_list.include?(todo) 
    @todo_list << todo
  end

  def todo_list
    @todo_list
  end

  def complete(todo)
    fail "Error, no matching Todo in Todo list" unless @todo_list.include?(todo) 
    @todo_list.delete(todo)
  end
end