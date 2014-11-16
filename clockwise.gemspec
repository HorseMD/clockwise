Gem::Specification.new do |s|
  s.name = 'clockwise'
  s.email = 'alightedness@gmail.com'
  s.author = 'HorseMD'
  s.version = '0.0.2'
  s.date = Time.now.strftime("%Y-%m-%d")

  s.summary = 'Adds time methods to Integer class'
  s.description = 'Integer class extension with methods to help with time manipulation.'
  s.files = [
    'lib/clockwise.rb',
    'lib/timeunit.rb',
    'README.md',
    'clockwise.gemspec'
  ]
  s.homepage = 'https://github.com/HorseMD/clockwise'
  s.license = 'GPL-2'
end
