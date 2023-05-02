class SubscribersController < ApplicationController
  def index
    @subscribers_count = Subscriber.all.size
  end

  def create
    subscriber = Subscriber.new(subscriber_params)

    if subscriber.save
      flash[:notice] = 'saved!'
    else
      flash.now[:alert] = 'failed to save'
    end
    redirect_to subscribers_path
  end


  private 

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
