# frozen_string_literal: true

require 'test_helper'

class ItemDecoratorTest < ActiveSupport::TestCase
  def setup
    @item = Item.new.extend ItemDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
