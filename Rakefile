$:.unshift File.dirname(__FILE__) + 'lib'
require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

desc "Ejecutar todas las espectativas"
task :spec do
        sh "rspec -I. spec/matrizDispersa_spec.rb"
        sh "rspec -I. spec/matrizDe_spec.rb"
end

desc "Ejecutar las espectativas de la clase Matriz_Densa"
task :spec_denso do
        sh "rspec -I. spec/matrizDensa_spec.rb"
end

desc "Ejecutar las espectativas de la clase Matriz_Dispersa"
task :spec_disperso do
        sh "rspec -I. spec/matrizDispersa_spec.rb"
end

desc "Ejecutar con documentacion: --format documentation"
task :doc do
        sh "rspec -I. spec/matrizDensa_spec.rb --format documentation"
        sh "rspec -I. spec/matrizDispersa_spec.rb --format documentation"
end

desc "Run /lib/frac_main.rb"
task :bin do
        sh "rspec -I. lib/prct09/prct09.rb"
end



desc "Run test with --format: html"
task :thtml do
        sh "rspec -I. spec/matrizDensa_spec.rb --format html > matrizDensa_spec.html"
        sh "rspec -I. spec/matrizDispersa_spec.rb --format html > matriDispersa_spec.html"
end

desc "install gems"
task :install do
        sh "bundle install"
end
