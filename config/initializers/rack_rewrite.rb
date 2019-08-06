if ENV['RACK_ENV'] == 'production'
  config.middleware.insert_before(Rack::Runtime, Rack::Rewrite) do
    r301 %r{.*}, 'https://www.circle-book.com$&', :if => Proc.new {|rack_env|
      rack_env['SERVER_NAME'] == 'circle-book.herokuapp.com'
    }
  end
end