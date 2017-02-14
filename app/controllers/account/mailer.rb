class Account::Mailer < Devise::Mailer

  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'devise/mailer'

  # def self.confirmation_instructions(record, token, opts={})
  #   new(:confirmation_instructions, record, token, opts)
  #   # headers["Custom-header"] = "Bar"
  #   # opts[:from] = 'tatasutiadi@fellow.lpkia.ac.id'
  #   # opts[:reply_to] = 'tatasutiadi@gmail.com'
  #   # super
  # end
  #
  # def self.reset_password_instructions(record, token, opts={})
  #   headers["Custom-header"] = "Bar"
  # end

end
