module Platformer

  class FpsLimiter

    def initialize(fps, context, &block)
      @fps, @context, @block = fps, context, block

      @then = Time.now
      @interval = 1000 / @fps
    end

    def update
      now = Time.now
      delta = `#{now} - #{@then}`

      if delta > @interval
        @block.call(@context, delta)
        @then = now
      end
    end

  end

end