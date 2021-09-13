# Automakefile

## Usage

You need a config file who look like this:

```
main.c;fakeProj.h
EXEC;fakeProj
calc.c;calc/calc.h fakeProj.h
PROJECT_DIR;fakeProj1
CC;clang
SOURCES_DIR;.
CFLAGS;-ftest-coverage -O2
HEADERS_DIR;include
LIBS_DIR;librarys
BCK_DIR;backup
ZIP;tar
ZIPFLAGS;-cvvf
UNZIP;tar
UNZIPFLAGS;-xvf
```

Meaning:

```
main.c;fakeProj.h  -> .c file associated with .h file
EXEC;fakeProj   -> name of the exeutable
calc.c;calc/calc.h fakeProj.h -> same as the first one
PROJECT_DIR;fakeProj1   -> project dir, everything is said
CC;clang     -> compiler
SOURCES_DIR;.  -> sources dir, everything is said to
CFLAGS;-ftest-coverage -O2  -> compilation flags
HEADERS_DIR;include   -> dir where the headers are located 
LIBS_DIR;librarys   ->  dir where the liraries are located 
BCK_DIR;backup   -> backup dir
ZIP;tar    -> zip binary
ZIPFLAGS;-cvvf    -> zipflags
UNZIP;tar    -> unzip binary
UNZIPFLAGS;-xvf   -> unzipflags
```
