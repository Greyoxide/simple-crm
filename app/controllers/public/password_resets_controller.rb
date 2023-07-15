class Public::PasswordResetsController < Public::BaseController

  skip_before_action :verify_authenticity_token
  before_action :get_request

  def new
    @reset = @request.user

    if @request.blank? or @reset.blank? or @request.expired?
      redirect_to [:new, :public, :session, issues: expiration_message]
    end
  end

  def create
    @reset = @request.user
    if @reset.update(password_reset_params)
      set_credentials_for @reset
      @request.destroy
      redirect_to [:companies]
    else
      # flash[:error] = 'Something went wrong'
      render :new
    end

  end

  private

  def set_credentials_for(user)
    # this message sets the user session credentials
    reset_session
    user.regenerate_key_card
    cookies.encrypted[:id] = user.key_card
  end

  def get_request
    @request = PasswordResetRequest.find_by_auth(params[:auth]) if params[:auth]
  end

  def password_reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def expiration_message
    'This password request has expired, please request a new one.'
  end

end