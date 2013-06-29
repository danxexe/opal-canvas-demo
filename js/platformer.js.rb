require 'platformer/events'
require 'platformer/fps_limiter'
require 'platformer/game'
require 'platformer/actor_input'
require 'platformer/actor'
require 'platformer/canvas_renderer'
require 'platformer/dsl'
require 'platformer/kernel_ext'

module Platformer

  def self.requestAnimationFrame(*attrs)
    @requestAnimationFrame ||= begin
      $global['requestAnimationFrame'] ||
      $global['mozRequestAnimationFrame'] ||
      $global['webkitRequestAnimationFrame'] ||
      $global['msRequestAnimationFrame']
    end

    @requestAnimationFrame.call(*attrs)
  end
end
