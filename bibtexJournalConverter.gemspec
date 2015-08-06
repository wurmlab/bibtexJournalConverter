Gem::Specification.new do |s|
  # meta
  s.name        = 'bibtexJournalConverter'
  s.version     = '0.0.1'
  s.authors     = ['Yannick Wurm']
  s.email       = ['y.wurm@qmul.ac.uk']
  s.homepage    = 'https://github.com/wurmlab/bibtexJournalConverter'
  s.license     = 'MIT'

  s.summary     = 'Bibtex converter'
  s.description = <<DESC
Converts bibtex .bib journal entries from long to short journal title and vice-versa. Can also remove '.' from abbreviations
DESC

  # dependencies
  s.add_dependency('bibtex-ruby',          '~> 4.0')
  s.add_dependency('ruby-progressbar',     '~> 1.7')
  s.add_development_dependency('rake',     '~> 10.4', '>= 10.4.2')
  s.add_development_dependency('minitest', '~> 5.5',  '>= 5.5.1')

  # gem
  s.files         = Dir['lib/**/*']
  s.files         = s.files + ['Gemfile', 'bibtexJournalConverter.gemspec']
  s.files         = s.files + ['README.md']
  s.require_paths = ['lib']
  s.executables   = ['bibtexJournalConverter']
end
