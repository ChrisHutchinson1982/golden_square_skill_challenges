require "todo"

RSpec.describe Todo do
  it "constructs a task and returns it as a string" do
    task = Todo.new("Task 1")
    expect(task.task_details).to eq "Task 1"
  end 
end