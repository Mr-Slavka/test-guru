class FeedbackMailer < ApplicationMailer
  def new_feedback(feedback)
    @email = User.find_by(type: 'Admin').email
    @feedback = feedback

    mail(to: @email, subject: 'Feedback')
  end
end
