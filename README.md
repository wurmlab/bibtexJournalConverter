Getting Started
===============

Converts bibtex .bib journal entries from long to short journal title and vice-versa. Can also remove '.' from abbreviated journal titles.

```
git clone
bundle install
bundle exec bin/bibtexJournalConverter -a info/journal_abbreviations_lifescience.txt,info/additional_abbreviations.txt --shorten --remove-dots mybibliography.bib > mybibliography-shortjournaltitles.bib
```

```
gem install bibtexJournalConverter
bibtexJournalConverter -h
bibtexJournalConverter -a info/journal_abbreviations_lifescience.txt,info/additional_abbreviations.txt --shorten --remove-dots mybibliography.bib > mybibliography-shortjournaltitles.bib
```

## External info

Need to be separated by ' = '. Here I'm using some from: `https://raw.githubusercontent.com/JabRef/reference-abbreviations/master/journals/journal_abbreviations_lifescience.txt`


## Reason

Developed for: 
  Wurm (2015). **Arthropod genomics beyond fruit flies: bridging the gap between proximate and ultimate causation**. Briefings in Functional Genomics. 

Funding: 
  YW was supported by the Biotechnology and Biological Sciences Research Council [BB/K004204/1] and the Natural Environment Research Council [NE/L00626X/1, EOS Cloud].