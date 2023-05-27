class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Signed in successfully.
" if signed_in?
  end

  def new
    super
  end

  def destroy
    super
    flash[:notice] = "Signed out successfully." unless signed_in?
  end
end