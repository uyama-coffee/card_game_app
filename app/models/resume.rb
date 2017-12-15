class Resume < ApplicationRecord
  belongs_to :user

  has_many :contacts, through: :users
  has_many :card_game_experiences, dependent: :destroy
  has_many :card_games, through: :card_game_experiences, source: :card_game
  accepts_nested_attributes_for :card_game_experiences, allow_destroy: true

  mount_uploader :profile_image, ImageUploader

  validates :profile_image,   presence: true
  validates :first_name,      presence: true
  validates :first_name_kana, presence: true, kana: true
  validates :last_name,       presence: true
  validates :last_name_kana,  presence: true, kana: true
  validates :contact_method,  presence: true
  validates :phone_number,    presence: true, if: Proc.new { |a| a.contact_method == 1 }
  validate  :require_career_over_one_month

  #カードゲーム経験は1ヶ月以上
  def require_career_over_one_month
    card_game_experiences.each do |cge|
      errors.add(:base, :no_experience) if cge.experience_year == 0 && cge.experience_month == 0
    end
  end


  extend Enumerize
  enumerize :contact_method, in: { email: 0, phone: 1 }
end
