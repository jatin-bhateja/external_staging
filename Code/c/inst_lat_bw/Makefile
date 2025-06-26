CC=gcc
LINKLIBS=-lpthread
SOURCES=instlat.c util.c lock.c pause.c stores.c bindtocpu.c fpops.c loads.c
OBJECTS=$(SOURCES:.c=.o)
CFLAGS=-c -DLINUX
EXECUTABLE=instlat
#STATIC=-static
ONEOBJ=instlatbw.o

build: $(SOURCES) $(ONEOBJ) $(EXECUTABLE)

$(ONEOBJ): $(OBJECTS)
	ld -r $(OBJECTS)  -o $@

$(EXECUTABLE) : $(ONEOBJ)
	$(CC) $(STATIC) $(ONEOBJ) $(LINKLIBS)  -o $@

util.o: util.c common.h
	$(CC) $(CFLAGS) util.c  -o util.o

bindtocpu.o: bindtocpu.c common.h
	$(CC) $(CFLAGS) bindtocpu.c  -o bindtocpu.o

lock.o: lock.c common.h
	$(CC) $(CFLAGS) lock.c  -o lock.o

fpops.o: fpops.c common.h
	$(CC) $(CFLAGS) fpops.c  -o fpops.o

pause.o: pause.c common.h
	$(CC) $(CFLAGS) pause.c  -o pause.o

stores.o: stores.c common.h
	$(CC) $(CFLAGS) stores.c  -o stores.o

loads.o: loads.c common.h
	$(CC) $(CFLAGS) loads.c  -o loads.o

instlat.o: instlat.c common.h
	$(CC) $(CFLAGS) instlat.c  -o instlat.o

.c.o: 
	$(CC) $(CFLAGS) $< -o $@

astyle:
	astyle --style=otbs --indent=tab --break-blocks --pad-oper --pad-header --unpad-paren --delete-empty-lines --align-pointer=type *.[ch]

clean:
	rm -rf *.o *.d $(EXECUTABLE) 

-include $(SOURCES:%.c=%.d)
