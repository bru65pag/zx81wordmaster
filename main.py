code = {
    'A': '$26',
    'B': '$27',
    'C': '$28',
    'D': '$29',
    'E': '$2A',
    'F': '$2B',
    'G': '$2C',
    'H': '$2D',
    'I': '$2E',
    'J': '$2F',
    'K': '$30',
    'L': '$31',
    'M': '$32',
    'N': '$33',
    'O': '$34',
    'P': '$35',
    'Q': '$36',
    'R': '$37',
    'S': '$38',
    'T': '$39',
    'U': '$3A',
    'V': '$3B',
    'W': '$3C',
    'X': '$3D',
    'Y': '$3E',
    'Z': '$3F',
}


def main():

    try:
        file = open('data/answers.txt', 'r')
    except:
        print("Cannot open /data/answers.txt for reading")
        exit()
    try:
        fileout = open('wordmaster.asm', 'w')
    except:
        print("Cannot open wordmaster.asm for writing")
    letter = 0
    while (c:= file.read(1)):
        if c ==('\n'):
            continue
        if letter == 0:
            print('DEFB ',end='', file=fileout)
        print(code[c.upper()],end='',file=fileout)
        if letter == 4:
            print('\n',end='',file=fileout)
            letter = 0
        else:
            print(',',end='',file=fileout)
            letter += 1

    file.close()
    fileout.close()

if __name__ == '__main__':
    main()