require 'opal'
require 'platformer'

include Platformer::DSL

game do

  attach '#game', width: $global.document.width, height: $global.document.height

  actor do

    on :init do |e|
      @x = game.renderer.element.width / 2
      @y = game.renderer.element.height / 2
      @radius = 70
      @t = 0
      @r = 1
      @dir = 1
    end

    on :draw do
      @x += `#{@r} * Math.sin(#{@t})`
      @y += `#{@r} * Math.cos(#{@t})`
      @t += 1

      @radius += 0.01

      if @r > 80
        @dir = -1
      elsif @r < 0
        @dir = 1
      end

      @r += (0.1 * @dir * (@radius / 70))

      context = game.renderer.context

      context.beginPath
      context.arc(@x, @y, @radius, 0, 2 * `Math.PI`, false)
      context.fillStyle = '#65ACC2'
      context.fill
      context.lineWidth = 6
      context.strokeStyle = '#2E5794'
      context.stroke
    end

  end

end
