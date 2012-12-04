set :application, "iphone-3gs-white-sale"

set :user, conf_ssh_user
set :deploy_to, "#{conf_deploy_to}#{application}"

set :deploy_via, :remote_cache
set :copy_exclude, ["config", "design", ".git", ".gitignore", "readme.md", "Capfile"]
ssh_options[:forward_agent] = true

set :scm, :git
set :repository, conf_repository

server conf_server, :app, :web, :db, :primary => true
set :use_sudo, false
set :rewrite_base, "/iphone-3gs-white/"

before "deploy:symlink", "copy_to_prod"

desc "Copies the site to the right place"
task :copy_to_prod do
    puts "#{current_release}"
    run "chmod 755 #{current_release}/public/ -R"

    htaccess = <<-EOF
ErrorDocument 404 /404.html
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase #{rewrite_base}
</IfModule>
EOF
    put htaccess, "#{current_release}/public/.htaccess"
    run "chmod 755 #{current_release}/public/.htaccess"
end