#!/bin/bash

java -cp stanford-ner.jar edu.stanford.nlp.process.PTBTokenizer 3armf2016_1aparte_14072016.doc.txt.1 > 3armf2016_1aparte_14072016.doc.txt.1.tok
perl -ne 'chomp; print "$_\tO\n"' 3armf2016_1aparte_14072016.doc.txt.1.tok > 3armf2016_1aparte_14072016.doc.txt.1.tsv
java -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop 3armf2016_1aparte_14072016.prop

java -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier ner-model.3armf2016.ser.gz
 -testFile jane-austen-emma-ch2.txt

