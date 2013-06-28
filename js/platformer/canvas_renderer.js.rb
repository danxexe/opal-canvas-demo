module Platformer

  class CanvasRenderer

    attr_accessor :element
    attr_accessor :game

    def initialize(element, attrs = {}, game = nil)
      @element = initialize_canvas(element, attrs)
      $global.e = @element
      @game = game

      @game.on :draw, self.method(:draw)
    end

    def context
      @context ||= Native.new(element.getContext('2d')).to_n
    end

    def draw
      game.actors.each do |actor|
        actor.trigger :draw
      end
    end


    private

    def initialize_canvas(element, attrs = {})
      if element.tagName == 'CANVAS'
        canvas = element
      else
        canvas = $global.document.createElement('canvas')
        element.appendChild canvas
      end

      native_canvas = Native.new(canvas).to_n
      native_canvas.width = attrs[:width] if attrs[:width]
      native_canvas.height = attrs[:height] if attrs[:height]

      canvas
    end

  end

end