require 'bibtex'
require 'ruby-progressbar'

class Bibtexjournalconverter
  # NOTE:
  #   Methods that should be called as 'Bibtexjournalconverter.function_name', or class methods
  #   should be defined here.
  class << self
    # Returns version number from 'gemspec' file.
    def version
      gemspec_file = File.join(File.dirname(__FILE__), '..', 'bibtexJournalConverter.gemspec')
      gemspec = eval File.read gemspec_file
      gemspec.version
    end
  end

  # This function will be called when 'Bibtexjournalconverter' is initialized.
  def initialize(files, options = {})
    @files = files
    @options = options
  end

  # Attributes.
  attr_reader :files, :options

  # Instance methods.

  def run
    STDERR.puts "Will process: #{files}, with the following options: #{options}.\n"

    ## read conversion table
    longToShort = Hash.new
    options[:abbreviation_files].each do |abbreviations_file|
      convertfile = File.open(abbreviations_file, 'r')
      convertfile.each_line do |line|
        next if line.match(/^#/)
        long, short, extra = line.split(" = ")
        raise IOError("Too many '=' signs in: " + line) unless extra.nil?
        short = short.gsub('.', '') if options[:remove_dots]
        longToShort[long] = short.chomp
      end
      STDERR.puts "Total #{longToShort.size} long/short title pairs after reading #{abbreviations_file}"
    end

    ## do it baby
    bib = BibTeX.open(files[0])
    progressbar = ProgressBar.create(:title => "Journals", :total => longToShort.size,
                                     :format=> "|%B| %E", :output => STDERR)
    journalConversion = (options[:shorten] == true) ? longToShort : longToShort.invert

    bib.each do |entry|
      entry.journal = journalConversion[entry.journal] || entry.journal
      progressbar.increment
    end

    STDERR.puts 'Done.'
    puts bib
  end
end
