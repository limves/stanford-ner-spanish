#!/bin/bash 

wget  http://www-nlp.stanford.edu/software/ner-example/jane-austen-emma-ch1.txt

# Apply Tokenizer
java -cp stanford-ner.jar edu.stanford.nlp.process.PTBTokenizer jane-austen-emma-ch1.txt > jane-austen-emma-ch1.tok

# Add tabs and 0
perl -ne 'chomp; print "$_\tO\n"' jane-austen-emma-ch1.tok > jane-austen-emma-ch1.tsv.raw

# Samples
wget http://www-nlp.stanford.edu/software/ner-example/jane-austen-emma-ch1.tsv
wget http://www-nlp.stanford.edu/software/ner-example/jane-austen-emma-ch2.txt
wget http://www-nlp.stanford.edu/software/ner-example/jane-austen-emma-ch2.tsv

# Create CRFClassifier
wget http://www-nlp.stanford.edu/software/ner-example/austen.prop
java -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop austen.prop

# Test
java -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier ner-model.ser.gz -testFile jane-austen-emma-ch2.tsv
