class LoginMailJob < ActiveJob::Base
  queue_as :email

  def perform(person)
    PersonMailer.login_mail(person).deliver_now
  end
end
