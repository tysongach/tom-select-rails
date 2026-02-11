require "rails"

module TomSelect
  class Engine < ::Rails::Engine
    initializer "tom-select-rails.importmap", before: "importmap" do |app|
      if Rails.application.config.respond_to?(:importmap)
        app.config.importmap.paths << Engine.root.join("config/importmap.rb")
      end
    end
  end
end
