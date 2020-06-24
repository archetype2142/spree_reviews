require 'spree_core'
require 'spree_reviews/engine'
require 'spree_reviews/version'
require 'spree_extension'
require 'coffee_script'
require 'sass/rails'
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem

kernel_ext = "#{__dir__}/lib"
models_ext = "#{__dir__}/app/models/spree"
loader.ignore(kernel_ext)
loader.ignore(models_ext)
loader.setup

module Spree
  module Reviews    
    module_function

    def config(*)
      yield(Spree::Reviews::Config)
    end
   end
end
