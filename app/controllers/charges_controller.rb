class ChargesController < ApplicationController
  def index
  end

  def create
    binding.pry
  end

  def edit
  end

  def update
    user = User.find_by(id: params[:id])
     charge = Stripe::Charge.create({
      customer: user.stripe_token,
      amount: params[:amount],
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
    flash[:notice] = 'Payment done'
    redirect_to user_path(params[:id])
  end
end
