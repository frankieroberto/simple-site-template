# encoding: UTF-8
require 'sprockets'
require 'sass'
require 'uglifier'

use Rack::Deflater

sproket_environment = Sprockets::Environment.new
sproket_environment.append_path 'assets/stylesheets'
sproket_environment.append_path 'assets/javascripts'
sproket_environment.css_compressor = :scss
sproket_environment.js_compressor  = :uglify

map '/assets' do 
  run sproket_environment
end

use Rack::Static,
  :urls => ['/'],
  :root => "public",
  :index => 'index.html',
  :header_rules => [[:all, {'Cache-Control' => 'public, max-age=1'}]]

run lambda { |env|   }