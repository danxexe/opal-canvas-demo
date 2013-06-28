module Platformer

  class Game
    include Platformer::Events

    attr_accessor :renderer
    attr_reader :actors

    def initialize
      @actors = []
      trigger :init
    end

    def start!
      request_frame
    end


    private

    def request_frame
      Platformer.requestAnimationFrame self.method(:on_frame)
    end

    def on_frame
      trigger :draw, renderer
      request_frame
    end

  end

end