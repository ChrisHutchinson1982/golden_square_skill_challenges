require "secret_diary"

RSpec.describe SecretDiary do
  it "returns 'Go away!' when diary starts off" do
    fake_diary_entry = double(:fake_diary_entry)
    secret_diary_entry = SecretDiary.new(fake_diary_entry)
    expect { secret_diary_entry.read }.to raise_error "Go away!"
  end
  it "when unlocked returns contents" do
    fake_diary_entry = double(:fake_diary_entry, read: "Hello world")
    secret_diary_entry = SecretDiary.new(fake_diary_entry)
    secret_diary_entry.unlock
    expect(secret_diary_entry.read).to eq "Hello world"
  end
  it "when locked returns 'Go away!'" do
    fake_diary_entry = double(:fake_diary_entry)
    secret_diary_entry = SecretDiary.new(fake_diary_entry)
    secret_diary_entry.unlock
    secret_diary_entry.lock
    expect { secret_diary_entry.read }.to raise_error "Go away!"
  end
end