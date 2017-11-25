class Shops::ContactsController < ApplicationController
  def index
    #応募者データを2段階検索
    #@projects= Project.where(shop_id:current_shop.id)
    #@contacts = Contact.where(project_id: @projects.ids)
    shop = Shop.find(current_shop.id)
    project = shop.projects.ids
    @contacts = Contact.where(project_id: project)
    #ユーザー情報を抽出
    userid = @contacts.pluck(:user_id)
    #@resumes = Resume.get_resume(userid)
    #@resume = Resume.where(user_id: @contacts[:user_id])

    #経験カードゲーム情報を抽出
    #@card_game_experiences = CardGameExperience.where(resume_id: @resume.id)
  end
end
