class WelcomeController < ApplicationController
  def index
    return redirect_to url_for(:show) if session[:access_token].present? and session[:access_secret].present?

    Etsy.api_key = ENV['ETSY_API_KEYSTRING']
    Etsy.api_secret = ENV['ETSY_API_SECRET']

    Etsy.callback_url = url_for(:authorize_url)

    logger.debug Etsy.callback_url

    request_token = Etsy.request_token
    session[:request_token]  = request_token.token
    session[:request_secret] = request_token.secret
    redirect_to Etsy.verification_url
  end

  def authorize
    access_token = Etsy.access_token(
        session[:request_token],
        session[:request_secret],
        params[:oauth_verifier]
    )

    session[:access_token] = access_token.token
    session[:access_secret] = access_token.secret

    redirect_to :show
  end

  def show
    redirect_to :root unless session[:access_token].present? and session[:access_secret].present?

    @user = Etsy.myself(session[:access_token], session[:access_secret])
  end
end
