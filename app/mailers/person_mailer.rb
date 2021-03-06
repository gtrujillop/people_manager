class PersonMailer < ActionMailer::Base
  default from: 'gaston.trujillo.java@gmail.com'

  def login_mail(person)
    @person = person
    mail(
      to: @person.email,
      subject: 'People App - New person added'
    )
  end

  def sign_off_mail(person)
    @person = person
    mail(
      to: @person.email,
      subject: 'People App - Sign Off'
    )
  end
end
