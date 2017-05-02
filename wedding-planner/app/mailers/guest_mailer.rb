class GuestMailer < ApplicationMailer
  default from: "WeddingPlannerNotifier@gmail.com"

  # def guest_welcome(email)
  #   @email = email
  #   puts "ATTEMPTING TO SEND MAIL!"
  #   mail(to: @email, subject: "You've been added to our wedding guest list")
  # end

  def guest_rsvp(id, email)
    @id = id
    @email = email
    puts "ATTEMPTING TO SEND MAIL!"
    mail(to: @email, subject: "Send your RSVP")
  end

end
