
include_recipe "ruby_build::default"

directory "node[:rsc_ruby][:ruby][:prefix_path]" do
  action :create
end

log "installing Ruby #{node[:rsc_ruby][:ruby][:version]} to #{node[:rsc_ruby][:ruby][:prefix_path]} "
ruby_build_ruby node[:rsc_ruby][:ruby][:version] do
  prefix_path node[:rsc_ruby][:ruby][:prefix_path]
end

ENV["PATH"]="#{node[:rsc_ruby][:ruby][:prefix_path]}/bin:#{ENV["PATH"]}"
log "PATH #{ENV["PATH"]}"

log "install rubygems"
execute "#{node[:rsc_ruby][:ruby][:prefix_path]}/bin/gem update --system"

log "install rubygems from gem_package"
gem_package "rubygems-update" do
  gem_binary "#{node[:rsc_ruby][:ruby][:prefix_path]}/bin/gem"
end
gems= ["bundler","rake"]

gems.each do |gem|
  gem_package gem do
    gem_binary "#{node[:rsc_ruby][:ruby][:prefix_path]}/bin/gem"
    options(:force => true)
  end
end

ohai "reload" do
  action :reload
end
