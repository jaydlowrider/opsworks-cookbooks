include_recipe 'mysql::service'

template do
  path value_for_platform(
    ['centos','redhat','fedora','amazon'] => {'default' => '/etc/my.cnf'},
    'default' => '/etc/mysql/my.cnf'
    )
  source 'my.cnf.erb'
  backup false
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, resources(:service => 'mysql')
end
