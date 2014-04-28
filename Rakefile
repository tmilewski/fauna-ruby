require 'echoe'

Echoe.new("fauna") do |p|
  p.author = "Fauna, Inc."
  p.project = "fauna"
  p.summary = "Ruby client for the Fauna distributed database."
  p.retain_gemspec = true
  p.require_signed
  p.certificate_chain = ["fauna-ruby.pem"]
  p.licenses = ["Mozilla Public License, Version 2.0 (MPL2)"]
  p.dependencies = ["faraday ~>0.9.0", "json ~>1.8.0"]
  p.development_dependencies = ["mocha", "echoe", "minitest ~>4.0"]
end

task :beautify do
  require "ruby-beautify"
  Dir["**/*rb"].each do |filename|
    s = RBeautify.beautify_string(:ruby, File.read(filename))
    File.write(filename, s) unless s.empty?
   end
end

task :prerelease => [:manifest, :test, :install]
