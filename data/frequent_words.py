import sys

def main():
    with open('frequency_list.txt') as f:
        result = [words.strip()for words in f]
    f.close()
    words=[]
    print(len(result))
    for r in result:
        # print(len(r))
        # print(len(words))
        if (len(r)==int(sys.argv[1])) & (len(words) <= 2000):
            words.append(r)
    f=open('frequency_list_' + sys.argv[1] + '_letters.txt','w')
    for w in words:
        print(w,end='\n',file=f)
    f.close()

if __name__ == "__main__":
    main()