class Public::SessionsController < Public::BaseController

  skip_before_action :verify_authenticity_token
  before_action :redirect_to_new, except: [:new, :create, :destroy]

  def index
    # i dunno why this is necessary because I'm redirecting before this is even rendered
  end

  def new
    @auth_issues = params[:issues]
  end

  def create
    user = User.unscoped.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      puts 'valid user========================================'
      # user.regenerate_key_card
      cookies.encrypted[:id] = user.key_card

      redirect_to [:companies]
    else
      render :new
    end
  end

  def destroy
    Current.user.regenerate_key_card
    cookies.encrypted[:id] = nil
    redirect_to [:public, :root]
  end

  private

  def redirect_to_new
    render :new
  end

end