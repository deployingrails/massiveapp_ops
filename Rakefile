namespace :puppet do
  desc "Validate puppet manifests"
  task :validate do
    files = Dir.glob('modules/*/manifests/*.pp').select{ |f| !File.directory?(f) }
    sh("puppet --parseonly #{files.join(' ')}")
  end
end

task :default => 'puppet:validate'

