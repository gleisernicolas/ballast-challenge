module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { message: e.message }, status: :unprocessable_entity
    end

    rescue_from LoanCreationService::UnavailableBookError do |e|
      render json: { message: e.message }, status: :unprocessable_entity
    end

    rescue_from LoanCreationService::MemberAlreadyHasBookError do |e|
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end
end