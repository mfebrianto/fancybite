# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += ['plugins/bootstrap/css/bootstrap.min.css']
Rails.application.config.assets.precompile += ['font-awesome.min.css']
Rails.application.config.assets.precompile += ['style.css']
Rails.application.config.assets.precompile += ['plugins.css']
Rails.application.config.assets.precompile += ['demo.css']
Rails.application.config.assets.precompile += ['plugins/bootstrap/bootstrap.min.js']
Rails.application.config.assets.precompile += ['plugins/slimscroll/jquery.slimscroll.min.js']
Rails.application.config.assets.precompile += ['plugins/popupoverlay/jquery.popupoverlay.js']
Rails.application.config.assets.precompile += ['plugins/popupoverlay/defaults.js']
Rails.application.config.assets.precompile += ['demo/dashboard-demo.js']
Rails.application.config.assets.precompile += ['flex.js']