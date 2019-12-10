require 'rails_helper'

describe User, type: :model do
  describe '#create' do
    
    describe 'False' do
      describe 'presence_all_false' do

        it "is invalid without a nickname" do
          user = build(:user, nickname: nil)
          user.valid?
          expect(user.errors.messages[:nickname]).to include("を入力してください")
        end

        it "is invalid without a email" do
          user = build(:user, email: nil)
          user.valid?
          expect(user.errors[:email]).to include("を入力してください")
        end

        it "is invalid without a password" do
          user = build(:user, password: nil)
          user.valid?
          expect(user.errors[:password]).to include("を入力してください")
        end

        it "is invalid without a kanji_last_name" do
          user = build(:user, kanji_last_name: nil)
          user.valid?
          expect(user.errors.messages[:kanji_last_name]).to include("を入力してください")
        end

        it "is invalid without a kanji_first_name" do
          user = build(:user, kanji_first_name: nil)
          user.valid?
          expect(user.errors[:kanji_first_name]).to include("を入力してください")
        end

        it "is invalid without a kana_last_name" do
          user = build(:user, kana_last_name: nil)
          user.valid?
          expect(user.errors[:kana_last_name]).to include("を入力してください")
        end

        it "is invalid without a kana_first_name" do
          user = build(:user, kana_first_name: nil)
          user.valid?
          expect(user.errors[:kana_first_name]).to include("を入力してください")
        end

        it "is invalid without a birth_day" do
          user = build(:user, birth_day: nil)
          user.valid?
          expect(user.errors[:birth_day]).to include("を入力してください")
        end

        it "is invalid without a tel_no" do
          user = build(:user, tel_no: nil)
          user.valid?
          expect(user.errors[:tel_no]).to include("を入力してください")
        end
      end


      describe 'email' do

        it "is invalid with a email only use @" do
          user = build(:user, email: "test@test")
          user.valid?
          expect(user.errors[:email]).to include("は不正な値です")
        end

        it "is invalid with a email only use ." do
          user = build(:user, email: "test.test")
          user.valid?
          expect(user.errors[:email]).to include("は不正な値です")
        end

        it "is invalid with a email not included @[a-z\d\-.]+\.[a-z]+\z/i" do
          user = build(:user, email: "test@.test")
          user.valid?
          expect(user.errors[:email]).to include("は不正な値です")
        end

        it "is invalid with a duplicate email" do
          user = create(:user)
          another_user = build(:user)
          another_user.valid?
          expect(another_user.errors[:email]).to include("はすでに存在します")
        end
      end


      describe 'password' do

        it "is invalid with a password only number" do
          user = build(:user, password: "12345678")
          user.valid?
          expect(user.errors[:password]).to include("は英字と数字の両方を含めて設定してください")
        end

        it "is invalid with a password only alphabet" do
          user = build(:user, password: "abcdefghi")
          user.valid?
          expect(user.errors[:password]).to include("は英字と数字の両方を含めて設定してください")
        end

        it "is invalid with a password less than 7 in length" do
          user = build(:user, password: "a12345")
          user.valid?
          expect(user.errors[:password]).to include("は7文字以上で入力してください")
        end

        it "is invalid with a password more than 128 in length" do
          user = build(:user, password: "a123456789a123456789a123456789a123456789a123456789a123456789a123456789a123456789a123456789a123456789a123456789a123456789a12345678")
          user.valid?
          expect(user.errors[:password]).to include("は128文字以内で入力してください")
        end
      end


      describe 'kanji_last_name' do

        it "is invalid with a kanji_last_name only number" do
          user = build(:user, kanji_last_name: "1234")
          user.valid?
          expect(user.errors[:kanji_last_name]).to include("は不正な値です")
        end
      end


      describe 'kanji_first_name' do

        it "is invalid with a kanji_first_name only number" do
          user = build(:user, kanji_first_name: "1234")
          user.valid?
          expect(user.errors[:kanji_first_name]).to include("は不正な値です")
        end
      end


      describe 'kana_last_name' do

        it "is invalid with a kana_last_name only alphabet" do
          user = build(:user, kana_last_name: "yamada")
          user.valid?
          expect(user.errors[:kana_last_name]).to include("はカナ文字で入力してください")
        end

        it "is invalid with a kana_last_name only hiragana" do
          user = build(:user, kana_last_name: "やまだ")
          user.valid?
          expect(user.errors[:kana_last_name]).to include("はカナ文字で入力してください")
        end

        it "is invalid with a kana_last_name only kanji" do
          user = build(:user, kana_last_name: "山田")
          user.valid?
          expect(user.errors[:kana_last_name]).to include("はカナ文字で入力してください")
        end
      end


      describe 'kana_first_name' do

        it "is invalid with a kana_first_name only alphabet" do
          user = build(:user, kana_first_name: "taro")
          user.valid?
          expect(user.errors[:kana_first_name]).to include("はカナ文字で入力してください")
        end

        it "is invalid with a kana_first_name only hiragana" do
          user = build(:user, kana_first_name: "たろう")
          user.valid?
          expect(user.errors[:kana_first_name]).to include("はカナ文字で入力してください")
        end

        it "is invalid with a kana_first_name only kanji" do
          user = build(:user, kana_first_name: "太郎")
          user.valid?
          expect(user.errors[:kana_first_name]).to include("はカナ文字で入力してください")
        end
      end


      describe 'tel_no' do

        it "is invalid with a tel_no less than 11 in length" do
          user = build(:user, tel_no: "1234567890")
          user.valid?
          expect(user.errors[:tel_no]).to include("は不正な値です")
        end

        it "is invalid with a tel_no more than 11 in length" do
          user = build(:user, tel_no: "123456789012")
          user.valid?
          expect(user.errors[:tel_no]).to include("は不正な値です")
        end

        it "is invalid with a tel_no number and alphabet" do
          user = build(:user, tel_no: "a1234567890")
          user.valid?
          expect(user.errors[:tel_no]).to include("は不正な値です")
        end

        it "is invalid with a tel_no number and dash" do
          user = build(:user, tel_no: "090-1234-1234")
          user.valid?
          expect(user.errors[:tel_no]).to include("は不正な値です")
        end
      end
    end


    describe 'True' do

      describe 'presence_all_true' do

        it "is valid with a all contents" do
          user = build(:user)
          expect(user).to be_valid
        end
      end
    
      describe 'nickname' do

        it "is valid with a nickname only kanji" do
          user = build(:user, nickname: "山田")
          expect(user).to be_valid
        end

        it "is valid with a nickname only hiragana" do
          user = build(:user, nickname: "やまだ")
          expect(user).to be_valid
        end

        it "is valid with a nickname only katakana" do
          user = build(:user, nickname: "ヤマダ")
          expect(user).to be_valid
        end

        it "is valid with a nickname only number" do
          user = build(:user, nickname: "0123")
          expect(user).to be_valid
        end

        it "is valid with a nickname only alphabet" do
          user = build(:user, nickname: "abcd")
          expect(user).to be_valid
        end
      end

      describe 'email' do

        it "is valid with a email inclede @[a-z\d\-.]+\.[a-z]+\z/i" do
          user = build(:user, nickname: "aaa@bb.cc")
          expect(user).to be_valid
        end
      end

      describe 'password' do

        it "is valid with a password number and alphabet" do
          user = build(:user, password: "aaa111bbb222")
          expect(user).to be_valid
        end

        it "is valid with a password more than 6 in length" do
          user = build(:user, password: "a123456")
          expect(user).to be_valid
        end

        it "is valid with a password less than 129 in length" do
          user = build(:user, password: "a123456789a123456789a123456789a123456789a123456789a123456789a123456789a123456789a123456789a123456789a123456789a123456789a1234567")
          expect(user).to be_valid
        end
      end


      describe 'kanji_last_name' do

        it "is invalid with a kanji_last_name only hiragana" do
          user = build(:user, kanji_last_name: "やまだ")
          expect(user).to be_valid
        end

        it "is invalid with a kanji_last_name only katakana" do
          user = build(:user, kanji_last_name: "ヤマダ")
          expect(user).to be_valid
        end

        it "is invalid with a kanji_last_name only kanji" do
          user = build(:user, kanji_last_name: "山田")
          expect(user).to be_valid
        end
      end


      describe 'kanji_first_name' do

        it "is invalid with a kanji_first_name only hiragana" do
          user = build(:user, kanji_first_name: "たろう")
          expect(user).to be_valid
        end

        it "is invalid with a kanji_first_name only katakana" do
          user = build(:user, kanji_first_name: "タロウ")
          expect(user).to be_valid
        end

        it "is invalid with a kanji_first_name only kanji" do
          user = build(:user, kanji_first_name: "太郎")
          expect(user).to be_valid
        end
      end


      describe 'kana_last_name' do

        it "is invalid with a kana_last_name only katakana" do
          user = build(:user, kana_last_name: "ヤマダ")
          expect(user).to be_valid
        end
      end


      describe 'kana_first_name' do

        it "is invalid with a kana_first_name only katakana" do
          user = build(:user, kana_first_name: "タロウ")
          expect(user).to be_valid
        end
      end


      describe 'birth_day' do

        it "is invalid with a birth_day" do
          user = build(:user, birth_day: "2000-05-11")
          expect(user).to be_valid
        end
      end


      describe 'birth_day' do

        it "is invalid with a birth_day" do
          user = build(:user, birth_day: "2000-05-11")
          expect(user).to be_valid
        end
      end

      describe 'tel_no' do

        it "is invalid with a tel_no 11 in length" do
          user = build(:user, tel_no: "12345678901")
          expect(user).to be_valid
        end
      end
    end
  end
end