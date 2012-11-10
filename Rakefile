require 'rubygems'
require 'bundler'

Bundler.require
require './lib/app'
require 'erb'
require 'tilt'

namespace :assets do
  desc 'compile all data'
  task :compile => [:compile_js, :compile_css, :compile_html] do
  end

  desc 'compile javascript assets'
  task :compile_js do
    begin
      sprockets = PgBookServer.settings.sprockets
      outpath   = PgBookServer.settings.assets_path
      # 1 stage
      asset     = sprockets['application.js']
      outfile   = Pathname.new(outpath).join("application.min.js") # may want to use the digest in the future?
      FileUtils.mkdir_p outfile.dirname
      asset.write_to(outfile)
      puts "successfully compiled js assets"
    rescue
      puts "failed compile js assets"
    end
  end

  desc 'compile css assets'
  task :compile_css do
    begin
      sprockets = PgBookServer.settings.sprockets
      outpath   = PgBookServer.settings.assets_path
      # 1 stage
      asset     = sprockets['application.scss']
      outfile   = Pathname.new(outpath).join("application.min.css") # may want to use the digest in the future?
      FileUtils.mkdir_p outfile.dirname
      asset.write_to(outfile)
      puts "successfully compiled css assets"
    rescue
      puts "failed compile css assets"
    end
  end
  
  desc 'compile html assets'
  task :compile_html do
    begin
      # helpers
      include AssetHelpers
      def erb(template, options={}, locals={}, &block)
        templateEngine = Tilt[:erb].new(File.join(File.dirname(__FILE__), 'lib', 'views', "#{template}.erb"), 1, options)
        templateEngine.render({}, locals, &block)
      end
      # HTML
      outpath   = File.join(File.dirname(__FILE__))
      # html files
      File.open(File.join(outpath, 'index.html'), 'w') {|f| f.write(erb('index.html')) }
      puts "successfully compiled html assets"
    rescue
      puts "failed compile html assets"
    end
  end
  # todo: add :clean_all, :clean_css, :clean_js tasks, invoke before writing new file(s)
end