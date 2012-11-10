# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rake', :task => 'assets:compile_js' do
  watch(%r{^assets/javascripts/.+$})
end
guard 'rake', :task => 'assets:compile_css' do
  watch(%r{^assets/stylesheets/.+$})
end
guard 'rake', :task => 'assets:compile_html' do
  watch(%r{^lib/views/.+$})
end