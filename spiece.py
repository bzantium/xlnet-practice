import sentencepiece as spm
import argparse

def main():
    spm.SentencePieceTrainer.train('--input=wiki.txt '
                                   '--model_prefix=spiece '
                                   '--vocab_size=32000 '
                                   '--character_coverage=0.99995 '
                                   '--model_type=unigram '
                                   '--control_symbols=<cls>,<sep>,<pad>,<mask>,<eod> '
                                   '--user_defined_symbols=<eop>,.,(,),",-,_,£,€ '
                                   '--shuffle_input_sentence '
                                   '--input_sentence_size=10000000 ')

if __name__ == "__main__":
    main()