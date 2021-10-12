C:\opscode\chef-workstation\bin\chef generate repo chef-repo
New-Item -Path $env:AGENT_HOMEDIRECTORY\.chef -ItemType directory
Set-Location $env:AGENT_HOMEDIRECTORY\.chef
New-Item -Path $env:AGENT_HOMEDIRECTORY\.chef\credentials
@"
current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                'daniel'
client_key               ${env:DANIEL_PRIVKEY}
validation_client_name   'scerus-validator'
validation_key           ${env:ORG_PRIVKEY}
chef_server_url          'https://chef-automate.scerus.com/organizations/${env:ORG}'
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:vault_mode] = 'client'
"@ | Out-File -FilePath $env:AGENT_HOMEDIRECTORY\.chef\config.rb