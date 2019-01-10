require "./event.cr"
require "./event_publisher.cr"

abstract class AggregateRoot
  @events = [] of Event

  def publish_events(events_publisher : EventsPublisher)
    @events.each do |event|
      events_publisher.publish_event(event)
    end
  end

  private def register_event(evt : Event)
    @events << evt
  end
end
