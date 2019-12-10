class CategoriesController < ApplicationController
  before_action :set_categories, only: [:index]

  def index

  end

  def search
    @children = Category.find(params[:category_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end
  
  private

  def set_categories
    @parents = Category.where(ancestry: nil)
  end
end
