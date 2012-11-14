require 'rubygems'
require 'sinatra/base'
require 'sprockets'
require 'sprockets-sass'
require 'haml'
require 'sass'
require 'compass'
require 'yui/compressor'
require 'uglifier'
require 'execjs'
require 'base64'
require 'rack/utils'
require 'html_compressor'
require 'vegas'
require 'zurb-foundation'

Rack::Mime::MIME_TYPES['.template'] = Rack::Mime.mime_type('.html')

module AssetHelpers
    def asset_path(source, options = {})
      "public/images/#{source}"
    end
    def image_path(source, options = {})
      "public/images/#{source}"
    end
    def asset_data_uri(source, options = {})
      unless Assets.instance.find_asset(source).nil?
        asset  = Assets.instance.find_asset(source)
        base64 = Base64.encode64(asset.to_s).gsub(/\s+/, "")
        "data:#{asset.content_type};base64,#{Rack::Utils.escape(base64)}"
      end
    end
  end

class Assets < Sprockets::Environment

  def initialize(assets_path)
    super
    context_class.instance_eval do
      include AssetHelpers
    end
  end
end

class SHTTilt < Tilt::Template
  def self.default_mime_type
    'application/javascript'
  end

  def prepare
    @namespace = "this.SHT"
  end

  attr_reader :namespace

  def evaluate(scope, locals, &block)
    context = ExecJS.compile(Pathname(__FILE__).dirname.join('..','assets', 'javascripts', 'vendors').join('hogan-2.0.0.min.js').read)
    templateString = context.eval("Hogan.compile(#{data.inspect}, {asString: true})")
    template_key = path_to_key scope
    <<-HoganTemplate
(function() { 
#{namespace} || (#{namespace} = {});
#{namespace}[#{template_key.inspect}] = new Hogan.Template(#{templateString}, #{data.inspect}, Hogan, {});
}).call(this);
    HoganTemplate
  end
  
  def path_to_key(scope)
    path = scope.logical_path.to_s.gsub(/^templates\/(.*)$/i, "\\1").split('/')
    path.last.gsub!(/^_/, '')
    path.join('/')
  end
end

class PgBookServer < Sinatra::Application
  
  set :root, File.dirname(__FILE__)
  set :public_folder, File.expand_path(File.join(root, '..', 'public'))
 
  set :sprockets, (Assets.new(root) { |env| env.logger = Logger.new(STDOUT) })
  set :assets_prefix, 'assets'
  set :assets_path, File.join(root, '..', 'public', assets_prefix)
  set :compass_gem_root, Gem.loaded_specs['compass'].full_gem_path
  set :foundation_gem_root, Gem.loaded_specs['zurb-foundation'].full_gem_path
  
  configure do
    sprockets.register_engine ".hogan", SHTTilt
    
    sprockets.append_path File.join(root, '..', 'assets', 'stylesheets')
    sprockets.append_path File.join(compass_gem_root, 'frameworks', 'compass', 'stylesheets')
    sprockets.append_path File.join(compass_gem_root, 'frameworks', 'blueprint', 'stylesheets')
    sprockets.append_path File.join(foundation_gem_root, 'scss')
    sprockets.append_path File.join(foundation_gem_root, 'vendor', 'assets', 'javascripts')
    sprockets.append_path File.join(root, '..', 'assets', 'javascripts')
    
    sprockets.css_compressor = YUI::CssCompressor.new
    sprockets.js_compressor  = Uglifier.new(mangle: true)
  end
  
  helpers do
    include AssetHelpers
  end

  get /\/(public|vendor)\/(.*)/ do
    filename = File.join(params['captures'][0], params['captures'][1])
    content_type File.extname(filename)
    read_relative_file '..', filename
  end
  
  get '/' do
    content_type 'text/html'
    erb :"index.html"
    #read_relative_file 'public', 'index.html'
  end
  
  get '/release' do
    content_type 'text/html'
    read_relative_file '..', 'index.html'
  end

  def read_relative_file(*args)
    File.read(File.join(File.expand_path(File.dirname(__FILE__)), *args))
  end

end