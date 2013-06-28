module Platformer

  module Events

    def event_callbacks
      @event_callbacks ||= {}
    end

    def on(event_name, callback = nil, &block)
      callbacks = event_callbacks[event_name] ||= []
      callbacks.push callback if callback
      callbacks.push block if block
    end

    def off(event_name, callback_to_remove = nil)
      return unless callbacks = event_callbacks[event_name]

      callbacks.delete callback_to_remove
    end

    def trigger(event_name, *attrs)
      return unless callbacks = event_callbacks[event_name]

      callbacks.each do |callback|
        callback.call(*attrs)
      end
    end

  end

end
