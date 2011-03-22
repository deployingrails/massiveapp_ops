#!/usr/bin/env ruby

def recently_created_record_count
  `mysql -uroot -proot --silent --skip-column-names massiveapp --execute "select count(id) from accounts where created_at > (now() - interval 1 hour)"`.strip.to_i
end

def publish(count)
  system("gmetric --name 'accounts' --value #{count} --type uint8")
end

publish recently_created_record_count

