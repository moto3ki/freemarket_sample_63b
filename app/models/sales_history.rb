class SalesHistory < ApplicationRecord

  belongs_to :user

  def path_set
    if notice_todolist_status == 1
      return "notices"
    else
      return "todolists"
    end
  end
end
