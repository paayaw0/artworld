class SubscribersController < ApplicationController
  def index
    @last_subscriber = Subscriber.last
  end

  def create
    subscriber = Subscriber.new(subscriber_params)
    jump = rand(100_000)

    previous_count = Subscriber.last(2).first&.count_jump || 0
    subscriber.count_jump = jump + previous_count + Subscriber.all.size


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
