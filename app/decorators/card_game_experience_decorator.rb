class CardGameExperienceDecorator < Draper::Decorator
  delegate_all

  def experience_year_month
    object.experience_year.to_s + '年' + object.experience_month.to_s + '月'
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
