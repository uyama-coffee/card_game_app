class ResumeDecorator < Draper::Decorator
  delegate_all
  decorates_association :cardgameexperience

  def full_name
    object.last_name + object.first_name
  end

  def full_name_kana
    object.last_name_kana + object.first_name_kana
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
