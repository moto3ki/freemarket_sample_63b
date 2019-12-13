class HomeController < ApplicationController
  
  def index
    # レディース
    @lady = Category.find(1)
    @lady_ids = @lady.indirect_ids
    @ladys = Item.where(category_id: @lady_ids).where(status: 0).order("created_at DESC").limit(10)
    # メンズ
    @man = Category.find(2)
    @man_ids = @man.indirect_ids
    @men = Item.where(category_id: @man_ids).where(status: 0).order("created_at DESC").limit(10)
    # 本・音楽・ゲーム
    @book_music_game = Category.find(3)
    @book_music_game_ids = @book_music_game.indirect_ids
    @book_music_games = Item.where(category_id: @book_music_game_ids).where(status: 0).order("created_at DESC").limit(10)
    # 家電・スマホ・カメラ
    @appliance_smartphone_camera = Category.find(4)
    @appliance_smartphone_camera_ids = @appliance_smartphone_camera.indirect_ids
    @appliance_smartphone_cameras = Item.where(category_id: @appliance_smartphone_camera_ids).where(status: 0).order("created_at DESC").limit(10)
    # おもちゃ・ホビー・グッズ
    @toy_hobby_good = Category.find(5)
    @toy_hobby_good_ids = @toy_hobby_good.indirect_ids
    @toy_hobby_goods = Item.where(category_id: @toy_hobby_good_ids).where(status: 0).order("created_at DESC").limit(10)
    
    @parents = Category.where(ancestry: nil)
  end
end
