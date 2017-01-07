# frozen_string_literal: true

# Docker tasks
namespace :docker do
  USERNAME = 'neilxx'.freeze
  WORKER = 'weathers_update_worker.rb'.freeze
  IMAGE = 'weathers_update'.freeze
  VERSION = '0.1.0'.freeze
  CONFIG_FILE = 'config.yml'.freeze

  desc 'Run the Docker image as a worker'
  task :run do
    puts "\nRUNNING WORKER WITH LOCAL CONTEXT"
    sh "docker run -e \"CONFIG_FILE=#{CONFIG_FILE}\" --rm -it " \
       "-v \"$PWD\":/worker -w /worker " \
       "#{USERNAME}/#{IMAGE}:#{VERSION} ruby #{WORKER}"
  end

  desc 'Build Docker image'
  task :build do
    puts "\nBUILDING WORKER IMAGE"
    sh "docker build --rm --force-rm -t #{USERNAME}/#{IMAGE}:#{VERSION} ."
  end

  desc 'Push Docker image to Docker Hub'
  task :push do
    puts "\nPUSHING IMAGE TO DOCKER HUB"
    sh "docker push #{USERNAME}/#{IMAGE}:#{VERSION}"
  end
end

namespace :iron do
  desc 'Register image as a worker on iron.io'
  task :register do
    puts "\nREGISTERING WORKER IMAGE WITH IRON.IO"
    sh "iron register #{USERNAME}/#{IMAGE}:#{VERSION}"
  end
end

# NOTE: only need to register worker image once (re-registering updates iron.io revision number)
desc 'Deploy by building and pushing Docker image, registering with iron.io'
task deploy: ['docker:build', 'docker:push', 'iron:register']

