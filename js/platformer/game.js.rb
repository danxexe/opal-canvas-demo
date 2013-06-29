module Platformer

  class Game
    include Platformer::Events

    attr_accessor :renderer
    attr_reader :actors

    attr_accessor :input_fps
    attr_accessor :draw_fps

    def initialize
      @actors = []
      trigger :init

      @draw_fps = 60
      @input_fps = 60
    end

    def start!
      @input_loop = Platformer::FpsLimiter.new(@input_fps, self) {|game| game.trigger :input, game.renderer }
      @draw_loop = Platformer::FpsLimiter.new(@draw_fps, self) {|game, delta| game.trigger :draw, game.renderer }
      request_frame
    end


    private

    def request_frame
      Platformer.requestAnimationFrame self.method(:on_frame)
    end

    def on_frame

      @input_loop.update
      @draw_loop.update

      request_frame
    end

  end

end