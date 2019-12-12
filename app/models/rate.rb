class Rate < ApplicationRecord

  belongs_to :user

  def rate_count_up(selected_rate)
    
    case selected_rate
    when "good"
      self.good += 1
    when "normal"
      self.normal += 1
    when "bad"
      self.bad += 1
    end
    return
  end

end
