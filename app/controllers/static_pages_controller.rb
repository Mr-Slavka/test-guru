class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def feedback; end

  def send_feedback
    @feedback = feedback_params
    FeedbackMailer.new_feedback(@feedback).deliver_now
    flash_options = { notice: 'Thank you for your feedback' }
    redirect_to root_path, flash_options
  end

  private

  def feedback_params
    params.permit(:message, :email)
  end
end
