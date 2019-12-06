require 'rails_helper'
describe RealAddress do
  describe '#create' do

    it "is invalid less than six-digits-numbers" do
      real_address = build(:real_address, post_code: 123456)
      real_address.valid?
      expect(real_address.errors[:post_code]).to include("フォーマットが不適切です")
    end

    it "is invalid more than eight-digits-numbers" do
      real_address = build(:real_address, post_code: 12345678)
      real_address.valid?
      expect(real_address.errors[:post_code]).to include("フォーマットが不適切です")
    end

    it "is invalid without 7 characters" do
      real_address = build(:real_address, post_code: "abc" || "abcdefghi")
      real_address.valid?
      expect(real_address.errors[:post_code]).to include("フォーマットが不適切です")
    end

    it "is invalid with 7 characters" do
      real_address = build(:real_address, post_code: "abcdefg")
      real_address.valid?
      expect(real_address.errors[:post_code]).to include("フォーマットが不適切です")
    end

    it "is valid with seven-digits-numbers" do
      real_address = build(:real_address, post_code: 2345678)
      expect(real_address.post_code).to eq 2345678
    end

    it "is valid with a blank" do
      real_address = build(:real_address, post_code: "")
      expect(real_address.post_code).to eq ""
    end

  end
end