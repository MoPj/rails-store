module ApplicationHelper

  def number_to_currency(number, options = {})
    options[:locale] ||= I18n.locale
    super(number/100, options)
  end

end