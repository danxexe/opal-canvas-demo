module Platformer

  class Actor
    include Platformer::Events

    attr_reader :game

    def initialize(game)
      @game = game
      game.actors << self
      trigger :init
    end

  end

end
