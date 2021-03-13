#!/usr/bin/python3

import sys
from FixedPoint import FXfamily, FXnum

def main(args):
    if (len(args) != 2):
        print("Usage: ./convert_float_file_to_fixed.py <input file> <output file>")
        return

    input_file_name = args[0]
    output_file_name = args[1]

    print("Hello from convert_float_file_to_fixed!")
    print("Input file: " + input_file_name)
    print("Output file: " + output_file_name)
    proceed = input("Proceed? (Y/N) ")
    if (proceed != "Y" and proceed != "y"):
        print("Aborting")
        return

    fam = FXfamily(10,8)

    with open(input_file_name, 'r') as input_file:
        with open(output_file_name, 'w+') as output_file:
            for line in input_file:
                if (line[0] == '#'):
                    output_file.write(line)
                    continue
                elif (line[0] == '\n'):
                    output_file.write(line)
                else:
                    values = line.strip('\n').split(',')
                    out_line = ""

                    for value in values:
                        converted_value = FXnum(float(value), fam)
                        binary = converted_value.toBinaryString()
                        binary = binary.replace('.', '_')
                        binary = binary[0] + '_' + binary[1:]
                        out_line = out_line + "18'b" + binary + ','
                    out_line = out_line[:-1] + '\n'
                    output_file.write(out_line)
    
    return


if __name__ == "__main__":
    main(sys.argv[1:])
