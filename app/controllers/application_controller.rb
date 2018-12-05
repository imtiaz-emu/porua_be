class ApplicationController < ActionController::API

  before_action :authenticate_request
  attr_reader :current_user

  include ExceptionHandler

  private
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: {error: 'Not Authorized'}, status: 401 unless @current_user
  end

  def authenticate_admin
    render json: {error: 'Not Authorized'}, status: 401 unless @current_user.has_role? :admin
  end

  def authorized?(object)
    if @current_user != object.user
      render json: {error: 'Not Authorized'}, status: 401
    else
      return true
    end
  end

end
