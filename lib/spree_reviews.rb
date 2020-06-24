require 'spree_core'
require 'spree_reviews/engine'
require 'spree_reviews/version'
require 'spree_extension'
require 'coffee_script'
require 'sass/rails'
require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.setup # ready!

all_models = "#{__dir__}/my_gem/app/models/spree"
loader.ignore(all_models)

module Spree
  module Reviews
    module_function

    def config(*)
      yield(Spree::Reviews::Config)
    end
  end
end

loader.eager_load # optionally
