#!/bin/bash
tika --text  http://www.sat.gob.mx/informacion_fiscal/normatividad/Documents/3armf2016_1aparte_14072016.doc > 3armf2016_1aparte.txt

java -cp stanford-ner.jar edu.stanford.nlp.process.PTBTokenizer 3armf2016_1aparte.txt > 3armf2016_1aparte.tok
perl -ne 'chomp; print "$_\tO\n"' 3armf2016_1aparte.tok > 3armf2016_1aparte.tsv
java -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop 3armf2016_1aparte.prop

#java -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier ner-model.3armf2016.ser.gz  -testFile 3armf2016_1aparte_14072016.doc.txt.1
