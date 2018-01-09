class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value) 
    unless value =~ /^(0{1}\d{1,4}-{0,1}\d{1,4}-{0,1}\d{4})$/
        record.errors[attribute] << (options[:message] || I18n.t('errors.messages.invalid'))
    end
  end
end