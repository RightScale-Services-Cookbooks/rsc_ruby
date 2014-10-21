
include_recipe "ruby_build::default"

directory "node[:rsc_ruby][:ruby][:prefix_path]" do
  action :create
end

log "installing Ruby #{node[:rsc_ruby][:ruby][:version]} to #{node[:rsc_ruby][:ruby][:prefix_path]} "
ruby_build_ruby node[:rsc_ruby][:ruby][:version] do
  prefix_path node[:rsc_ruby][:ruby][:prefix_path]
end
ENV["PATH"]="#{ENV["PATH"]}:#{node[:rsc_ruby][:ruby][:prefix_path]}/bin"

log "install rubygems"
execute "#{node[:rsc_ruby][:ruby][:prefix_path]}/bin/gem update --system"

log "install rubygems from gem_package"
gem_package "rubygems-update" do
  gem_binary "#{node[:rsc_ruby][:ruby][:prefix_path]}/bin/gem"
end


ohai "reload" do
  action :reload
end

