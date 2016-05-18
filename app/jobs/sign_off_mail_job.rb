class SignOffMailJob < ActiveJob::Base
  queue_as :email

  def perform(person)
    PersonMailer.sign_off_mail(person).deliver_now
  end
end
