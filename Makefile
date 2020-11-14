project = exam

objs = $(project).o main.o
filesdir = /user/cse320/files

CC=gcc
CFLAGS := $(CFLAGS) -Wall -I$(filesdir)/include -mfpu=neon
CPPFLAGS := $(CPPFLAGS) -mfpu=neon
LDLIBS := $(LDLIBS) -lm -L$(filesdir)/lib -l320

CLEANEXTS   = o

outputfile  = $(project)

# Default target
.PHONY: all
all: $(outputfile)

$(project):  $(objs)

.PHONY: clean 
clean:
	rm -f $(outputfile)
	for file in $(CLEANEXTS); do rm -f *.$$file; done
