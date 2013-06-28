module Platformer

  module DSL

    def game(&block)
      game = Platformer::Game.new
      game.extend Platformer::DSL::Game
      game.instance_eval &block

      game.start!
    end

    module Game

      def attach(selector, attrs = {})
        element = $global.document.querySelector(selector)
        self.renderer = Platformer::CanvasRenderer.new(element, attrs, self)
      end

      def actor(&block)
        actor = Platformer::Actor.new(self)
        actor.instance_eval &block
        actor.trigger :init
      end

    end

  end

end