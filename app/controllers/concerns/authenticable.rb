module Authenticable
  private

  def authenticate
    @token ||= request.headers['Authorization']

    unless valid_token? # rubocop:disable Style/GuardClause
      render json: { errors: 'Não autorizado', status: :unauthorized }
    end
  end

  def valid_token?
    @token.present? && @token == Rails.application.credentials.token
  end
end
