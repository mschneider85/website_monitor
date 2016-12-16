unless ARGV.any? {|e| e =~ /guard/ }
  SimpleCov.start do
    add_filter ["/spec/", "config/environment.rb", "apps/web/application.rb"]
    add_group "Models", "lib/*"
    add_group "Views", "apps/web/views"
    add_group "Controllers", "apps/web/controllers"
  end
end
