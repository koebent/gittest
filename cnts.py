import os
import getpass
import pathlib
os.system('cls')
def GetState():
    stateName = input("Please enter the name of a State:")
    return stateName
def FormatState(funstate):
    if len(funstate) < 8:
        funstate = funstate.ljust(8, '*')
        return funstate
    else:
        return funstate
print(
    "\n1. Get information and display to screen"
    "\n2. call user created functions"
    "\n3. Write list of files to file"
    "\n4. Read specified file\n"
)
answer = input("Enter number of task to do: ")

if answer == "1":
    companyName = "dunwoody College"
    programName = "Computer Networking"
    uName = getpass.getuser()
    classFirst = input("Name of first class:")
    classSecond = input("Name of second class:")
    print(
        str(uName) + " works at " + str(companyName) + " in department " + str(programName)
    )
    print(
        str(classFirst) + " should be taken before " + str(classSecond)
    )
elif answer == "2":
    state = GetState()
    newState = FormatState(state)
    print(
        str(state) + " has been formatted to " + str(newState)
    )
elif answer == "3":
    fileName = input("Name of file:")
    fList = []
    for p in pathlib.Path('.').iterdir():
        if p.is_file():
            fList.append(p)
    with open(fileName, "w") as myFileWrite:
        for f in fList:
            myFileWrite.write(f.name)
            myFileWrite.write("\n")
elif answer == "4":
    readFile = input("Which file to read?")
    with open(readFile, "r+") as myFileRead:
        print(myFileRead.read())