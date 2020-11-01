class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "some_channel#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
