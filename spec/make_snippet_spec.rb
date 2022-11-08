require "make_snippet"

RSpec.describe "make_snippet method" do
  it "Return string for one word input" do
    expect(make_snippet("A")).to eq "A"
  end
end