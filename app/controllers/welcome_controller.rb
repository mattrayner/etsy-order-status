class WelcomeController < ApplicationController
  def index
    return redirect_to url_for(:show) if session[:access_token].present? and session[:access_secret].present?
    Etsy.callback_url = url_for(:authorize_url)

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

    user = Etsy.myself(session[:access_token], session[:access_secret])
    @user = User.find_or_create_by(etsy_id: user.id)

    redirect_to :show
  end

  def show
    redirect_to :root unless session[:access_token].present? and session[:access_secret].present?

    @user = Etsy.myself(session[:access_token], session[:access_secret])

    if @user.nil?
      reset_session
      return redirect_to :root
    else
      auth = {:access_token=>session[:access_token], :access_secret=>session[:access_secret]}

      orders = Etsy::Receipt.find_all_by_shop_id(@user.shop.id, auth.merge({limit: nil}))

      @open_orders = orders.select { |order| order.result['was_shipped'] == false  }

      @open_orders.map do |order|
        Receipt.find_or_create_by(etsy_id: order.id, user: @user.id, status: Status.find_by(title: 'Not Started'))
      end
    end
  end
end
