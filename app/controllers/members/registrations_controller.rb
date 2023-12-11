# frozen_string_literal: true

class Members::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  respond_to :json
  # POST /resource
  def create
    params[:member] = params[:member]&.merge(type: 'Member')

    super
  end

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:type])
  end

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: resource }
  end

  def register_failed
    render json: { message: resource.errors.full_messages.join(', ') }
  end
end
