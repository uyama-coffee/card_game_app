class Shops::ContactsController < ApplicationController
  def index
    #応募者データを2段階検索
    @projects= Project.where(shop_id:current_shop.id)
    @contacts = Contact.where(project_id: @projects.ids)
    #ユーザー情報を抽出
    @resume = Resume.where(user_id: @contacts.user_id)
    #経験カードゲーム情報を抽出
    @card_game_experiences = CardGameExperience.where(resume_id: @resume.id)
  end
end
