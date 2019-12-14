class CategoriesController < ApplicationController
  before_action :set_categories, only: [:index, :show]

  def index

  end

  def search
    @children = Category.find(params[:category_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @category = Category.find(params[:id])
    if @category.has_parent? && @category.has_children?
      @category_ids = @category.child_ids
    elsif @category.has_children?
      @category_ids = @category.indirect_ids
    else
      @items = Item.where(category_id: @category.id)
    end
    if @category_ids.present?
      @items = Item.where(category_id: @category_ids).order("created_at DESC")
    end
  end
  
  private

  def set_categories
    @parents = Category.where(ancestry: nil)
  end
end
