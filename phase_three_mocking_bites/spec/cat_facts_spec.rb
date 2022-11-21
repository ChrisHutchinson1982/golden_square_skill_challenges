require "cat_facts"

RSpec.describe CatFacts do
  it "calls an API to provide a random cat fact" do
    requester_dbl = double :requester
    expect(requester_dbl).to receive(:get)
      .with(URI("https://catfact.ninja/fact"))
      .and_return('{"fact":"The smallest wildcat today is the Black-footed cat. The females are less than 20 inches (50 cm) long and can weigh as little as 2.5 lbs (1.2 kg).","length":145}')
    cat_facts_1 = CatFacts.new(requester_dbl)
    result = cat_facts_1.provide
    expect(result).to eq "Cat fact: The smallest wildcat today is the Black-footed cat. The females are less than 20 inches (50 cm) long and can weigh as little as 2.5 lbs (1.2 kg)."
  end
end