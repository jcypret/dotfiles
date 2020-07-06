# remove unwanted gems
%w(byebug jbuilder tzinfo-data).each do |unwanted_gem|
  gsub_file "Gemfile", /gem '#{unwanted_gem}'.*\n/, ""
end
# add development/test gems
inject_into_file "Gemfile", <<-RUBY, after: "group :development, :test do\n"
  gem "pry-rails"
  gem "rspec-rails"
  gem "standard"
RUBY
# remove comments
gsub_file "Gemfile", /^\s*#.*$/, ""

run "bundle install"
rails_command "generate rspec:install"

# set up new frontend (webpack) directory
inside "app/frontend" do
  empty_directory "images"
  empty_directory "javascripts"
  empty_directory "stylesheets"
  file "packs/application.css"
  file "packs/application.js", <<~JS
    import RailsUJS from "@rails/ujs";
    require.context("../images", true);

    RailsUJS.start();
  JS
end

# disable generators
gsub_file "config/application.rb", /^\s*# Don't generate.*\n/, ""
gsub_file "config/application.rb", /^\s*config.generators.*\n/, <<-RUBY

    config.generators do |g|
      g.assets = nil
      g.test_framework = nil
      g.helper = nil
    end
RUBY

# add procfile
file "Procfile", <<~YAML
  web: bundle exec puma -p $PORT -C config/puma.rb
  assets: bin/webpack-dev-server
YAML

after_bundle do
  # change webpack directory
  remove_dir "app/assets"
  remove_dir "app/javascript"
  # update layout to use webpack css
  gsub_file "app/views/layouts/application.html.erb", "stylesheet_link_tag", "stylesheet_pack_tag"
  # configure frontend as webpack directory
  gsub_file "config/webpacker.yml", "app/javascript", "app/frontend"
  # normalize styles
  run "bundle exec standardrb --fix"

  git :init
  git add: "."
  git commit: "-m 'Initial commit'"
end
