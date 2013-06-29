module Platformer

  class Actor
    include Platformer::Events

    attr_reader :game

    def initialize(game)
      @game = game
      game.actors << self

      actor = self

      game.on :input do
        actor.trigger :input
      end

      trigger :init

      self.input
    end

    def input
      @input ||= Platformer::ActorInput.new
    end

  end

end
