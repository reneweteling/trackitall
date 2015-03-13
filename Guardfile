guard 'livereload' do
  watch(%r{app/controllers/.+\.rb$})
  watch(%r{app/models/.+\.rb$})
  watch(%r{app/admin/.+\.rb$})
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|coffee|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end

