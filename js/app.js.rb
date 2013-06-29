require 'jquery'
require 'opal'
require 'opal-jquery'
require 'platformer'

include Platformer::DSL

game do

  attach '#game', width: $global.document.width, height: $global.document.height

  actor do

    on :init do
      @x = game.renderer.element.width / 2
      @y = game.renderer.element.height / 2
      @radius = 70
      @speed = 10
    end

    on :draw do
      context = game.renderer.context

      context.beginPath
      context.arc(@x, @y, @radius, 0, 2 * `Math.PI`, false)
      context.fillStyle = '#65ACC2'
      context.fill
      context.lineWidth = 6
      context.strokeStyle = '#2E5794'
      context.stroke
    end

    on :input do
      @x -= @speed if input.left?
      @x += @speed if input.right?
      @y -= @speed if input.top?
      @y += @speed if input.bottom?
    end

  end

end
