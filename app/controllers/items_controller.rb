class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :own_show, :destroy]

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
    params.permit(:name,
                  :explain,
                  :condition,
                  :delivery_charge,
                  :delivery_method,
                  :from_area,
                  :delivery_period,
                  :price)
          .merge(user_id: current_user.id,
                 status: 0,
                 like_cnt: 0,
                 )
  end

  def item_image_params
    params.permit(:image)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
