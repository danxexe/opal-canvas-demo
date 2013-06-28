require 'platformer/events'
require 'platformer/game'
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
