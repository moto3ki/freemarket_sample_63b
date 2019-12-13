class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :own_show, :destroy]
  before_action :set_categories, only: [:show, :own_show, :edit, :new]

  def new
    @item = Item.new
    @item_images = ItemImage.new
  end

  def show
    @seller_items = Item.where(user_id: @item.user_id)
  end
  
  def create
    
    item_save_result  = true
    image_save_result = true
    @parents = Category.where(ancestry: nil)
    @item_images = ItemImage.new
    # itemsレコード保存のエラーチェック
    @item = Item.new(item_params)
    item_save_result = @item.valid?
    # item_imagesレコード保存のエラーチェック
    if params[:item_images].present?
      image_save_result = true
    else
      image_save_result = @item_images.valid?
    end
    # itemレコード、item_imagesのバリデーションを通過した場合
    if item_save_result && image_save_result
      if @item.save
        params[:item_images][:image].each do |image|
          @item_images = ItemImage.create(image: image, item_id: @item.id)
        end
      end
      redirect_to root_path
    else
      render action: :new
    end
    
  rescue
    render action: :new
  end
  
  def edit
    @item_images = ItemImage.new
    @selected_category3 = Category.find(@item.category_id)
    @selected_category2 = @selected_category3.parent
    @selected_category1 = @selected_category2.parent
    @children = Category.find(@selected_category1.id).children
    @grandchildren = Category.find(@selected_category2.id).children
    render template: 'items/new'
  end
  
  def update
    image_save_result = true
    @item_images = ItemImage.new
    # 画像削除
    if params[:del_item_images].present?
      params[:del_item_images][:id].each do |id|
        item_image = ItemImage.find(id)
        item_image.destroy
      end
    end
    # 画像追加
    if params[:item_images].present?
      params[:item_images][:image].each do |image|
        @item_images = ItemImage.new(image: image, item_id: @item.id)
        image_save_result =  @item_images.save
      end
    else
      if @item.item_images.count == 0
        @item_images = ItemImage.new(image: nil)
        image_save_result = @item_images.save
      end
    end
    
    # 商品編集
    if @item.update(item_params) && image_save_result
      redirect_to own_show_item_path(@item)
    else
      render template: 'items/new'
    end
  end
  
  def destroy
    if @item.destroy
      redirect_to selling_items_users_path
    else
      render own_show
    end
  end
  
  def own_show
    
  end
  
  # 商品検索
  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
    @keyword = params[:keyword]
  end
  
  private
  def item_params
    params.require(:item)
    .permit(:name,
    :explain,
    :condition,
    :delivery_charge,
    :delivery_method,
    :prefecture_id,
    :delivery_period,
    :price,
    :category_id)
    .merge(user_id: current_user.id,
    status: 0,
    like_cnt: 0,
    )
  end
  
  def item_image_params
    params.require(:item_images).require(:image)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def set_categories
    @parents = Category.where(ancestry: nil)
  end
end
