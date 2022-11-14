require '08_test_drive_a_class_system/todo'
require '08_test_drive_a_class_system/todo_list'

RSpec.describe "todo_integration" do
  it "adds todo and returns incomplete list" do
    list = TodoList.new
    todo = Todo.new("brush teeth")
    list.add(todo)
    expect(list.incomplete).to eq [todo]
  end

  it "filters incomplete list" do
    list = TodoList.new
    todo = Todo.new("brush teeth")
    todo_2 = Todo.new("shower")
    list.add(todo)
    list.add(todo_2)
    todo_2.mark_done!
    expect(list.incomplete).to eq [todo]
  end

  it "filters complete list" do
    list = TodoList.new
    todo = Todo.new("brush teeth")
    todo_2 = Todo.new("shower")
    list.add(todo)
    list.add(todo_2)
    todo_2.mark_done!
    expect(list.complete).to eq [todo_2]
  end

  context "mark all todos as complete" do
    it "returns all tasks in complete" do
      list = TodoList.new
      todo = Todo.new("brush teeth")
      todo_2 = Todo.new("shower")
      list.add(todo)
      list.add(todo_2)
      list.give_up!
      expect(list.complete).to eq [todo, todo_2]
    end

    it "returns empty incomplete list" do
      list = TodoList.new
      todo = Todo.new("brush teeth")
      todo_2 = Todo.new("shower")
      list.add(todo)
      list.add(todo_2)
      list.give_up!
      expect(list.incomplete).to eq []
    end
  end
end