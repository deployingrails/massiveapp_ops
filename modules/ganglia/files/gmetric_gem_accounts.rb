#!/usr/bin/env ruby

require 'rubygems'
require 'gmetric'

def recently_created_record_count
  cmd = 'mysql -uroot -proot --silent --skip-column-names massiveapp_production --execute '
  cmd += '"select count(id) from accounts where '
  cmd += 'created_at > (now() - interval 1 hour)"'
  `#{cmd}`.strip.to_i
end

def publish(count)
  puts "Publishing accounts = #{count}" if ARGV.include?("-v")
  Ganglia::GMetric.send("33.33.13.38", 8649, {
    :name => "accounts",
    :type => "uint16",
    :value => count
  })
end

publish(recently_created_record_count)

