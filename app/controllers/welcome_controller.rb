class WelcomeController < ApplicationController
  skip_before_action :ensure_current_user

  def index
    visited
  end

  private

  def visited
    if cookies[:welcome_back]
      cookies.permanent[:welcome_back] = cookies.permanent[:welcome_back].to_i + 1
    else
      cookies[:welcome_back] = 1
    end
  end

end