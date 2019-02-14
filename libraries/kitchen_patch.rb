::Chef.run_context.node.automatic_attrs['toto'] = 'tata' if ChefConfig::Config['chef_server_url'] =~ /localhost/ && ChefConfig::Config['config_dir'] =~ /kitchen/
