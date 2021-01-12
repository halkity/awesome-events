class TicketsController < ApplicationController
  def new
    raise ActionController::RoutingError, "ログイン状態で TicketsController#new にアクセス"
  end
  
  def create
    event = Event.find(params[:event_id]) # <= params[:event_id]はroutesに記述あり
    @ticket = current_user.tickets.build do |t|
      t.event = event
      t.comment = params[:ticket][:comment]
    end
    if @ticket.save
      redirect_to event, notice: "このイベントに参加表明しました"
    end
  end
end
