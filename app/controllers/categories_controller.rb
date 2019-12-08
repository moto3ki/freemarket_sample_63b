class CategoriesController < ApplicationController
  before_action :set_categories, only: [:index]

  def index

  end

  private

  def set_categories
    @parents = Category.where(ancestry: nil)
  end
end
