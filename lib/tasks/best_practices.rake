desc "Generates the rails_best_practices HTML"
task :best_practices do |app|
  sh "rails_best_practices -f html --spec &>/dev/null"
  puts
  puts "Output will be in the file rails_best_practices_output.html"
  puts
end
