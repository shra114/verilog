#cd to RTL directory
#python ../scripts/csv2interface.py instruction_fetch.csv instruction_fetch.v

import sys
csvfile = sys.argv[1]
outvlog = sys.argv[2]

def parse_csv(file_name, delimeter=","):
    list1 = parse_file_as_list(file_name)
    return_list= list()
    for i in list1:
        if(i.strip()==""):
            continue
        return_list.append(i.split(delimeter))
    return return_list

def parse_file_as_list(file0):
    F = open(file0,'r')
    str0 = F.read()
    list1 = str0.split("\n")
    F.close()
    return list1

def write_str_to_file_with_mode(str1,file1, mode, print_log=True):
    F = open(file1,mode)
    F.write(str1)
    F.close()
    if(print_log):
        if(mode =="w"):
            print ("created the file ", file1)
        elif (mode=="a"):
            print("appended to the file ", file1)
    return None

def write_interface(csvlist, outvlog, spaces=20):
    outlist = list()
    print ("INFO", csvlist)
    for line in csvlist:
        direction   = line[0]
        if (direction == "input"):
            direction = "input "
        width       = line[1]
        name        = line[2]
        description = line[3]
        if (csvlist.index(line)!= len(csvlist)):
            outstr      = "  "+direction + " [" + width +"-1 : 0 ] " + " "*(spaces-len(width)) + name + ", // "+description
        else:
            #Don't write comma for the last port
            outstr      = "  "+direction + " [" + width +"-1 : 0 ] " + name + " "*(spaces-len(width)) + "  // "+description
        outlist.append(outstr)

    write_str_to_file_with_mode("\n".join(outlist), outvlog, "w", True)

    return None



csvlist = parse_csv(csvfile)[1:]
write_interface(csvlist, outvlog)


