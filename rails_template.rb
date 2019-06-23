# add rspec and standard
gem_group :development, :test do
  gem "rspec-rails"
  gem "standard"
end
run "bundle install"
rails_command "generate rspec:install"

# change webpack directory
run "rm -r app/assets"
run "rm -r app/javascript"
# update layout to use webpack css
gsub_file "app/views/layouts/application.html.erb", "stylesheet_link_tag", "stylesheet_pack_tag"
insert_into_file("app/controllers/application_controller.rb", <<-CODE, after: /^class ApplicationController.*\n/)
  prepend_view_path Rails.root.join("frontend")
CODE
insert_into_file("app/helpers/application_helper.rb", <<-'CODE', after: /^module ApplicationHelper.*\n/)
  def component(component_name, locals = {}, &block)
    name = component_name.split("_").first
    render("components/#{name}/#{component_name}", locals, &block)
  end

  alias c component
CODE

# set up new frontend (webpack) directory
inside "frontend" do
  empty_directory "components"
  empty_directory "images"

  # load Rails UJS and init
  file("packs/application.js", <<~CODE)
    import "init";
    import RailsUJS from "@rails/ujs";
    require.context("../images", true);

    RailsUJS.start();
  CODE

  # load applications js/css
  file("init/index.js", <<~CODE)
    import "./index.css";
  CODE
  file "init/index.css"
end

# disable generators
gsub_file "config/application.rb", /^\s*# Don't generate.*\n/, ""
gsub_file("config/application.rb", /^\s*config.generators.*\n/, <<-CODE)

    config.generators do |g|
      g.test_framework false
      g.stylesheets false
      g.javascripts false
      g.helper false
    end
CODE

# add procfile
file("Procfile", <<~CODE)
  web: bundle exec puma -p $PORT -C config/puma.rb
  assets: bin/webpack-dev-server
CODE

after_bundle do
  # configure frontend as webpack directory
  gsub_file "config/webpacker.yml", "app/javascript", "frontend"
  # normalize styles
  run "bundle exec standardrb --fix"

  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end
