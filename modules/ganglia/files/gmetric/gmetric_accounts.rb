#!/usr/bin/env ruby

def recently_created_record_count
  cmd = 'mysql -uroot -proot --silent --skip-column-names massiveapp --execute '
  cmd += '"select count(id) from accounts where '
  cmd += 'created_at > (now() - interval 1 hour)"'
  `#{cmd}`.strip.to_i
end

def publish(count)
  puts "Publishing accounts = #{count}" if ARGV.include?("-v")
  system("gmetric --name 'accounts' --value #{count} --type uint16")
end

publish(recently_created_record_count)

