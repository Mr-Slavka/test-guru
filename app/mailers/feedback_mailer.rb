class FeedbackMailer < ApplicationMailer
  def new_feedback(feedback)
    @email = Admin.first.email
    @feedback = feedback

    mail(to: @email, subject: 'Feedback')
  end
end
