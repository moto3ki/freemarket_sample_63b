class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :own_show, :destroy]

  def new
    @item = Item.new
    @item_images = ItemImage.new
  end

  def show
    
  end
  
  def create
    @item = Item.new(item_params)
    @item_images = @item.item_images.new(item_image_params)
    
    # 商品と商品画像が正常に登録できた場合
    if @item.save && @item_images.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    render template: 'items/new'
  end

  def update
    if @item.update(item_params)
      redirect_to own_show_item_path(@item)
    else
      render :edit
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
                  :price)
          .merge(user_id: current_user.id,
                 status: 0,
                 like_cnt: 0,
                 )
  end

  def item_image_params
    params.require(:item).permit(:image)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
