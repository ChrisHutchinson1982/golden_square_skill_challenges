require '08_test_drive_a_class_system/todo'

RSpec.describe Todo do
  it "adds task and returns it" do
    todo = Todo.new("brush teeth")
    expect(todo.task).to eq "brush teeth"
  end

  it "returns true if task is done" do
    todo = Todo.new("brush teeth")
    todo.mark_done!
    expect(todo.done?).to eq true
  end

  it "returns false if task is not done" do
    todo = Todo.new("brush teeth")
    expect(todo.done?).to eq false
  end

end