require '08_test_drive_a_class_system/todo_list'

RSpec.describe TodoList do
  it "returns empty instance" do
    list = TodoList.new
    expect(list.incomplete).to eq []
  end
end