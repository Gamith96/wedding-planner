class GuestMailer < ApplicationMailer
  default from: "lizzeh@gmail.com"

  def guest_welcome(email)
    @email = email
    puts "ATTEMPTING TO SEND MAIL!"
    mail(to: @email, subject: "Thanks for RSVP'ing to the wedding!")
  end
end
