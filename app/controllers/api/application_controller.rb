class Api::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  
  include Api::SessionsHelper
  
  class BadRequest < StandardError; end
  class Unauthorized < StandardError; end
  class PermissionDenied < StandardError; end
     
  #rescue_from Exception,                   :with => :render_500
  #rescue_from ActiveRecord::RecordInvalid, :with => :render_422
  #rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, ActionController::UnknownController, 
  #  AbstractController::ActionNotFound,    :with => :render_404
  #rescue_from PermissionDenied,            :with => :render_403
  #rescue_from Unauthorized,                :with => :render_401
  #rescue_from BadRequest,                  :with => :render_400

  protected

  def render_ng(status, errors)
    logger.info "Rendering #{status} with exception: #{errors}"
    errors_array = errors.class == Array ? errors : [errors]
    render json: {success: false, errors: errors_array}, status: status 
  end

  def render_nothing
    render :nothing => true, :status => 204
  end

  def render_400(exception)
    render_ng(400, exception.message)
  end

  def render_401(exception)
    render_ng(401, exception.message)
  end

  def render_403(exception)
    render_ng(403, exception.message)
  end

  def render_404(exception)
    render_ng(404, exception.message)
  end

  def render_422(exception)
    render_ng(422, exception.record.errors.full_messages)
  end

  def render_500(exception = nil)
    render_ng(500, [$!.message])
  end
end
