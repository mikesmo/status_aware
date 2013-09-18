class SessionController < ApplicationController
  def register
    id = params[:user][:facebook_id]
  end
end