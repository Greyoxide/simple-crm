class Public::PasswordResetRequestsController < Public::BaseController

  def new
  end

  def create
    if params[:email].present?
      @user = User.find_by_email(params[:email])
      unless @user.blank? or @user.suspended?
        @password_reset_request = @user.password_reset_requests.new
        @password_reset_request.save
      end
      redirect_to [:new, :public, :session, issues: confirmation_message]
    else
      flash[:error] = "Something went wrong let's try that again."
      render :new
    end
  end

  private

  def confirmation_message
    ['If we this email matches our records you can expect an password reset email.']
  end

end