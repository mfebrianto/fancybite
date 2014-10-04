# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += ['plugins/bootstrap/css/bootstrap.min.css']
Rails.application.config.assets.precompile += ['frontpage/bootstrap.min.css']
Rails.application.config.assets.precompile += ['bootstrap-responsive.min.css']
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
Rails.application.config.assets.precompile += ['errors.css']

Rails.application.config.assets.precompile += ['nivo-slider.css']
Rails.application.config.assets.precompile += ['anythingslider.css']
Rails.application.config.assets.precompile += ['lightbox.css']
Rails.application.config.assets.precompile += ['style-cupcake.css']
Rails.application.config.assets.precompile += ['contact-form.js']
Rails.application.config.assets.precompile += ['jquery.anythingslider.min.js']
Rails.application.config.assets.precompile += ['jquery.arctext.js']
Rails.application.config.assets.precompile += ['jquery.nivo.slider.pack.js']
Rails.application.config.assets.precompile += ['jQueryRotateCompressed.2.2.js']
Rails.application.config.assets.precompile += ['lightbox.js']
Rails.application.config.assets.precompile += ['jquery.js']
Rails.application.config.assets.precompile += ['errors.js']

# css for front
Rails.application.config.assets.precompile += %w( front/custom.css front/colors_1.css front/bootstrap.css )
Rails.application.config.assets.precompile += %w( front/bootstrap-responsive.css front/fullcalendar.css front/font-awesome.css )
Rails.application.config.assets.precompile += %w( front/flexslider.css front/fullcalendar.css front/jquery.mCustomScrollbar.css )
Rails.application.config.assets.precompile += %w( front/style.css front/fullcalendar.css front/jquery.mCustomScrollbar.css )
Rails.application.config.assets.precompile += %w( front/skin.css front/fancybite.css )
# js for front
Rails.application.config.assets.precompile += %w( front/html5.js front/jquery.js front/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( front/jquery.flexslider.js front/fullcalendar.js front/jquery.mCustomScrollbar.concat.min.js )
Rails.application.config.assets.precompile += %w( front/excanvas.js front/jquery.easy-pie-chart.js front/jquery.bxslider.js )
Rails.application.config.assets.precompile += %w( front/custom.js front/jquery.jcarousel.min.js front/fancybite.js )