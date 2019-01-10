require "./event.cr"

module EventsPublisher
  abstract def publish_event(evt : Event)
end
