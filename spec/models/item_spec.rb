require 'rails_helper'

describe Item, type: :model do
  describe '#create' do
    
    #############################
    # 保存OK確認                 #
    #############################
    context 'can save' do
      it "[name] 40 byte" do
        category = create(:category)
        expect(build(:item, name: "abcdefghijabcdefghijabcdefghijabcdefghij")).to be_valid
      end

      it "[explain] 1000 byte" do
        category = create(:category)
        expect(build(:item, explain: "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij")).to be_valid
      end

      it "[prefecture_id] 47" do
        category = create(:category)
        expect(build(:item, prefecture_id: 47)).to be_valid
      end

      it "[price] 9999999" do
        category = create(:category)
        expect(build(:item, price: 9999999)).to be_valid
      end
    end
    #############################
    # 保存NG確認                 #
    #############################
    context 'can not save' do
      it "[name] nil" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors.messages[:name]).to include("入力してください")
      end
      
      it "[name] over 40 byte" do
        item = build(:item, name: "abcdefghijabcdefghijabcdefghijabcdefghija")
        item.valid?
        expect(item.errors.messages[:name]).to include("40 文字以下で入力してください")
      end

      it "[explain] nil" do
        item = build(:item, explain: nil)
        item.valid?
        expect(item.errors.messages[:explain]).to include("入力してください")
      end
      
      it "[explain] over 1000 byte" do
        item = build(:item, explain: "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghija")
        item.valid?
        expect(item.errors.messages[:explain]).to include("1000 文字以下で入力してください")
      end
      
      it "[condition] out of range" do
        item = build(:item, condition: 0)
        item.valid?
        expect(item.errors.messages[:condition]).to include("選択してください")
      end

      it "[delivery_charge] out of range" do
        item = build(:item, delivery_charge: 0)
        item.valid?
        expect(item.errors.messages[:delivery_charge]).to include("選択してください")
      end

      it "[delivery_method] out of range" do
        item = build(:item, delivery_method: 0)
        item.valid?
        expect(item.errors.messages[:delivery_method]).to include("選択してください")
      end

      it "[prefecture_id] out of range(min)" do
        item = build(:item, prefecture_id: 0)
        item.valid?
        expect(item.errors.messages[:prefecture_id]).to include("選択してください")
      end

      it "[prefecture_id] out of range(max)" do
        item = build(:item, prefecture_id: 48)
        item.valid?
        expect(item.errors.messages[:prefecture_id]).to include("選択してください")
      end

      it "[delivery_period] out of range" do
        item = build(:item, delivery_period: 0)
        item.valid?
        expect(item.errors.messages[:delivery_period]).to include("選択してください")
      end

      it "[price] out of range(min)" do
        item = build(:item, price: 299)
        item.valid?
        expect(item.errors.messages[:price]).to include("300以上9999999以下で入力してください")
      end

      it "[price] out of range(max)" do
        item = build(:item, price: 10000000)
        item.valid?
        expect(item.errors.messages[:price]).to include("300以上9999999以下で入力してください")
      end
    end
  end
end