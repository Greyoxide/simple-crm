class Public::SignupsController < Public::BaseController

  before_action :get_invite

  def new
    if @invitation.blank?
      redirect_to [:root], error: 'You must have an active invitation to signup.'
    elsif @invitation.expired?
      redirect_to [:root], error: 'This invitation has expired.'
    else
      @signup = Signup.new
    end
  end

  def create
    @signup = Signup.new(signup_params)
    @signup.invitation = @invitation.key
    @signup.organization = @invitation.organization
    if @signup.save
      session[:user] = @signup.key_card
      redirect_to [:companies]
    else
      render :new
    end
  end

  private

  def signup_params
    params.require(:signup).permit(:first_name, :last_name, :email, :time_zone, :password, :password_confirmation)
  end

  def get_invite
    @invitation = Invitation.find_by_key(params[:invite])
    if @invitation.blank? or @invitation.expired?
      redirect_to [:root], error: 'There is an issue with this invitation.'
    end
  end

end