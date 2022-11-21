require "diary"
require "secret_diary"

RSpec.describe "integration" do
  it "returns 'Go away!' when diary starts off" do
    diary_entry = Diary.new("Hello world")
    secret_diary_entry = SecretDiary.new(diary_entry)
    expect { secret_diary_entry.read }.to raise_error "Go away!"
  end
  it "when unlocked returns contents" do
    diary_entry = Diary.new("Hello world")
    secret_diary_entry = SecretDiary.new(diary_entry)
    secret_diary_entry.unlock
    expect(secret_diary_entry.read).to eq "Hello world"
  end
  it "when locked returns 'Go away!'" do
    diary_entry = Diary.new("Hello world")
    secret_diary_entry = SecretDiary.new(diary_entry)
    secret_diary_entry.unlock
    secret_diary_entry.lock
    expect { secret_diary_entry.read }.to raise_error "Go away!"
  end
end