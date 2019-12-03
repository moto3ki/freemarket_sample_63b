class KanaValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)

    unless value.match(/\A[ァ-ヶー－]+\z/)
      record.errors.add(attribute, 'はカナ文字で入力してください') 
    end

  end
end
