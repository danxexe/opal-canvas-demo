module Platformer

  class ActorInput

    def initialize
      body = Element['body']

      @input_map = {
        left: 37,
        top: 38,
        right: 39,
        bottom: 40
      }
      @reverse_input_map = @input_map.invert
      @keycodes = @input_map.values
      @states = {}

      body.on :keydown do |e|
        if input_key?(e.which)
          key = @reverse_input_map[e.which]
          @states[key] = true
        end
      end

      body.on :keyup do |e|
        if input_key?(e.which)
          key = @reverse_input_map[e.which]
          @states[key] = false
        end
      end

      @input_map.each do |k, v|
        define_input_getter k
      end

    end


    private

    def input_key?(keycode)
      @keycodes.include? keycode
    end

    def define_input_getter(k)
      class << self
        define_method "#{k}?" do
          @states[k]
        end
      end
    end

  end

end
