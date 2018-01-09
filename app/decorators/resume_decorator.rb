class ResumeDecorator < Draper::Decorator
  delegate_all
  decorates_association :cardgameexperience

  def full_name
    object.last_name + object.first_name
  end

  def full_name_kana
    object.last_name_kana + object.first_name_kana
  end
end
