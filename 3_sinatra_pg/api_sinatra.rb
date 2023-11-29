require 'sequel'
require 'sequel/extensions/seed'
require 'pg'
require 'json'
require 'multi_json'
require 'sinatra'
require 'sinatra/namespace'

DB = Sequel.connect(
  adapter: :postgres,
  database: 'sinatra_seq_dev',
  host: 'localhost',
  password: 'password',
  user: 'sinatra_admin',
  max_connections: 10,
  )

%w{ controllers models routes }.each { |dir| Dir.glob("./#{ dir }/*.rb", &method(:require)) }