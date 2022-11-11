require '04_intermezzo_debugging_1/say_hello'

RSpec.describe "say_hello method" do
  it "returns 'hello kay' when name is 'Kay'" do 
    result = say_hello("Kay")
    expect(result).to eq "hello Kay"
  end
end