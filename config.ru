require 'rubygems'
require 'bundler'
require 'sinatra/reloader'
Bundler.require

#Controllers
require './models/plant'
require './app'


run Plants