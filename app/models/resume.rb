class Resume < ApplicationRecord
  belongs_to :user
  has_many :cart_game_experiences, dependent: :destroy

  def self.get_resume(resource)
    for i in userid do
      resume = Resume.where(user_id:i)
      unless resume.blank?
        @resumes = resume
      end
    end
  end

end
