class KanaValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /^[ぁ-んァ-ンー－]+$/
        record.errors[attribute] << (options[:message] || I18n.t('errors.messages.not_a_kana'))
    end
  end
end
