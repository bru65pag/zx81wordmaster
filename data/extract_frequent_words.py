# Usage: python3 extract_frequent_words.py <word length>
# Extracts all the words of the length passed as parameter from most_frequent_words_english.txt
# into a file named words_<word length>_letters.txt
import sys

def main():
    with open('./most_frequent_words_english.txt') as f:
        result = [words.strip() for words in f]
    f.close()
    words=[]

    for r in result:
        # print(len(r))
        # print(len(words))
        if (len(r)==int(sys.argv[1])) & (len(words) <= 2000):
            words.append(r)
    f=open('words_' + sys.argv[1] + '_letters.txt','w')
    for w in words:
        print(w,end='\n',file=f)
    f.close()

if __name__ == "__main__":
    main()