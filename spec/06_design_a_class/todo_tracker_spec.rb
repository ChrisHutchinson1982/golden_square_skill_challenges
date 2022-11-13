require '06_design_a_class/todo_tracker'

RSpec.describe TodoTracker do

  context "initialize class" do
    it "returns empty array" do
      todo_tracker = TodoTracker.new
      expect(todo_tracker.todo_list).to eq []
    end
  end

  describe "add method" do 
    it "add and returns one todo" do
      todo_tracker = TodoTracker.new
      todo_tracker.add("Shopping")
      expect(todo_tracker.todo_list).to eq ["Shopping"]
    end
    it "add and returns mutiple todo's" do
      todo_tracker = TodoTracker.new
      todo_tracker.add("Shopping")
      todo_tracker.add("Walk the dog")
      expect(todo_tracker.todo_list).to eq ["Shopping", "Walk the dog"]
    end
    it "throws an exception if no todo is set" do
      todo_tracker = TodoTracker.new
      todo_tracker.add("Shopping")
      expect { todo_tracker.add("Shopping") }.to raise_error "Error, Todo already in Todo list"
    end
  end

  describe "complete method" do
    it "throws an exception if no todo is set" do 
      todo_tracker = TodoTracker.new
      expect { todo_tracker.complete("Shopping") }.to raise_error "Error, no matching Todo in Todo list" 
    end 
    it "removes todo from list" do 
      todo_tracker = TodoTracker.new
      todo_tracker.add("Walk the dog")
      todo_tracker.complete("Walk the dog")
      expect(todo_tracker.todo_list).to eq []
    end
    it "removes todo from list with mutiple todo's" do
      todo_tracker = TodoTracker.new
      todo_tracker.add("Shopping")
      todo_tracker.add("Walk the dog")
      todo_tracker.complete("Walk the dog")
      expect(todo_tracker.todo_list).to eq ["Shopping"]
    end
  end

end