require 'rails_helper'

describe SendAddress, type: :model do
  describe '#create' do

    describe 'False' do
      describe 'presence_all_false' do

        it "is invalid without a kanji_last_name" do
        send_address = build(:send_address, kanji_last_name: nil)
        send_address.valid?
        expect(send_address.errors.messages[:kanji_last_name]).to include("を入力してください")
        end

        it "is invalid without a kanji_first_name" do
        send_address = build(:send_address, kanji_first_name: nil)
        send_address.valid?
        expect(send_address.errors[:kanji_first_name]).to include("を入力してください")
        end

        it "is invalid without a kana_last_name" do
        send_address = build(:send_address, kana_last_name: nil)
        send_address.valid?
        expect(send_address.errors[:kana_last_name]).to include("を入力してください")
        end

        it "is invalid without a kana_first_name" do
        send_address = build(:send_address, kana_first_name: nil)
        send_address.valid?
        expect(send_address.errors[:kana_first_name]).to include("を入力してください")
        end

        it "is invalid without a post_code" do
        send_address = build(:send_address, post_code: nil)
        send_address.valid?
        expect(send_address.errors[:post_code]).to include("を入力してください")
        end

        it "is invalid without a prefecture" do
        send_address = build(:send_address, prefecture_id: nil)
        send_address.valid?
        expect(send_address.errors[:prefecture_id]).to include("を入力してください")
        end

        it "is invalid without a city" do
        send_address = build(:send_address, city: nil)
        send_address.valid?
        expect(send_address.errors[:city]).to include("を入力してください")
        end

        it "is invalid without a address" do
        send_address = build(:send_address, address: nil)
        send_address.valid?
        expect(send_address.errors[:address]).to include("を入力してください")
        end
      end

      describe 'kanji_last_name' do

        it "is invalid with a kanji_last_name only number" do
        send_address = build(:send_address, kanji_last_name: "1234")
        send_address.valid?
        expect(send_address.errors[:kanji_last_name]).to include("は不正な値です")
        end
      end


      describe 'kanji_first_name' do

        it "is invalid with a kanji_first_name only number" do
        send_address = build(:send_address, kanji_first_name: "1234")
        send_address.valid?
        expect(send_address.errors[:kanji_first_name]).to include("は不正な値です")
        end
      end


      describe 'kana_last_name' do

        it "is invalid with a kana_last_name only alphabet" do
        send_address = build(:send_address, kana_last_name: "yamada")
        send_address.valid?
        expect(send_address.errors[:kana_last_name]).to include("はカナ文字で入力してください")
        end

        it "is invalid with a kana_last_name only hiragana" do
        send_address = build(:send_address, kana_last_name: "やまだ")
        send_address.valid?
        expect(send_address.errors[:kana_last_name]).to include("はカナ文字で入力してください")
        end

        it "is invalid with a kana_last_name only kanji" do
        send_address = build(:send_address, kana_last_name: "山田")
        send_address.valid?
        expect(send_address.errors[:kana_last_name]).to include("はカナ文字で入力してください")
        end
      end


      describe 'kana_first_name' do

        it "is invalid with a kana_first_name only alphabet" do
        send_address = build(:send_address, kana_first_name: "taro")
        send_address.valid?
        expect(send_address.errors[:kana_first_name]).to include("はカナ文字で入力してください")
        end

        it "is invalid with a kana_first_name only hiragana" do
        send_address = build(:send_address, kana_first_name: "たろう")
        send_address.valid?
        expect(send_address.errors[:kana_first_name]).to include("はカナ文字で入力してください")
        end

        it "is invalid with a kana_first_name only kanji" do
        send_address = build(:send_address, kana_first_name: "太郎")
        send_address.valid?
        expect(send_address.errors[:kana_first_name]).to include("はカナ文字で入力してください")
        end
      end

      describe 'post_code' do

        it "is invalid more than 8-digits-numbers" do
        send_address = build(:send_address, post_code: 12345678)
        send_address.valid?
        expect(send_address.errors[:post_code]).to include("のフォーマットが不適切です")
        end


        it "is invalid without 7-characters" do
        send_address = build(:send_address, post_code: "abc" || "abcdefghi")
        send_address.valid?
        expect(send_address.errors[:post_code]).to include("のフォーマットが不適切です")
        end 

        it "is invalid wrongs format" do
        send_address = build(:send_address, post_code: "12-3678")
        send_address.valid?
        expect(send_address.errors[:post_code]).to include("のフォーマットが不適切です")
        end
      end

      describe 'prefecture_id' do

        it "is invalid with a prefecture_id mistake number" do
        send_address = build(:send_address, prefecture_id: 49)
        send_address.valid?
        expect(send_address.errors[:prefecture_id]).to include("を入力してください")
        end

        it "is invalid with a prefecture_id 0" do
        send_address = build(:send_address, prefecture_id: 0)
        send_address.valid?
        expect(send_address.errors[:prefecture_id]).to include("を入力してください")
        end
      end
    end

    describe 'True' do

      describe 'presence_all_true' do

        it "is valid with a all contents" do
        user = create(:user)
        send_address = build(:send_address)
        expect(send_address).to be_valid
        end
      end

      describe 'kanji_last_name' do

        it "is invalid with a kanji_last_name only hiragana" do
        user = create(:user)
        send_address = build(:send_address, kanji_last_name: "やまだ")
        expect(send_address).to be_valid
        end

        it "is invalid with a kanji_last_name only katakana" do
        user = create(:user)
        send_address = build(:send_address, kanji_last_name: "ヤマダ")
        expect(send_address).to be_valid
        end

        it "is invalid with a kanji_last_name only kanji" do
        user = create(:user)
        send_address = build(:send_address, kanji_last_name: "山田")
        expect(send_address).to be_valid
        end
      end


      describe 'kanji_first_name' do

        it "is invalid with a kanji_first_name only hiragana" do
        user = create(:user)
        send_address = build(:send_address, kanji_first_name: "たろう")
        expect(send_address).to be_valid
        end

        it "is invalid with a kanji_first_name only katakana" do
        user = create(:user)
        send_address = build(:send_address, kanji_first_name: "タロウ")
        expect(send_address).to be_valid
        end

        it "is invalid with a kanji_first_name only kanji" do
        user = create(:user)
        send_address = build(:send_address, kanji_first_name: "太郎")
        expect(send_address).to be_valid
        end
      end


      describe 'kana_last_name' do

        it "is invalid with a kana_last_name only katakana" do
        user = create(:user)
        send_address = build(:send_address, kana_last_name: "ヤマダ")
        expect(send_address).to be_valid
        end
      end


      describe 'kana_first_name' do

        it "is invalid with a kana_first_name only katakana" do
        user = create(:user)
        send_address = build(:send_address, kana_first_name: "タロウ")
        expect(send_address).to be_valid
        end
      end

      describe 'post_code' do

        it "is invalid with a post_code" do
        user = create(:user)
        send_address = build(:send_address, post_code: "123-1234")
        expect(send_address).to be_valid
        end
      end

      describe 'prefecture_id' do

        it "is invalid with a only integer" do
        user = create(:user)
        send_address = build(:send_address, prefecture_id: 1)
        expect(send_address).to be_valid
        end
      end

      describe 'city' do

        it "is invalid with a city only hiragana" do
        user = create(:user)
        send_address = build(:send_address, city: "よこはまし")
        expect(send_address).to be_valid
        end

        it "is invalid with a city only katakana" do
        user = create(:user)
        send_address = build(:send_address, city: "ヨコハマシ")
        expect(send_address).to be_valid
        end

        it "is invalid with a city only kanji" do
        user = create(:user)
        send_address = build(:send_address, city: "横浜市")
        expect(send_address).to be_valid
        end

        it "is invalid with a city only alphabet" do
        user = create(:user)
        send_address = build(:send_address, city: "Yokohamashi")
        expect(send_address).to be_valid
        end
      end


      describe 'address' do

        it "is invalid with a address use hiragana" do
        user = create(:user)
        send_address = build(:send_address, address: "あおやま１−１−１")
        expect(send_address).to be_valid
        end

        it "is invalid with a address use katakana" do
        user = create(:user)
        send_address = build(:send_address, address: "アオヤマ１−１−１")
        expect(send_address).to be_valid
        end

        it "is invalid with a address use kanji" do
        user = create(:user)
        send_address = build(:send_address, address: "青山１−１−１")
        expect(send_address).to be_valid
        end

        it "is invalid with a address only alphabet" do
        user = create(:user)
        send_address = build(:send_address, address: "Aoyama1-1-1")
        expect(send_address).to be_valid
        end
      end
    end
  end
end
