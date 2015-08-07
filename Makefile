PREFIX?= /usr/local
BINDIR?= $(PREFIX)/bin
MANDIR?= $(PREFIX)/share/man

SRC=	src
OBJS=	alloc.o c_ksh.o c_sh.o c_test.o c_ulimit.o edit.o emacs.o eval.o \
	exec.o expr.o history.o io.o jobs.o lex.o mail.o main.o mknod.o \
	misc.o path.o shf.o syn.o table.o trap.o tree.o tty.o var.o \
	version.o vi.o strtonum.o

CFLAGS=	-O3 -Wno-format-security -Wno-pointer-sign -Wno-int-conversion -iquote .

vpath %.c src

all: ${SRC}/_config.h ksh

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

ksh: ${OBJS}
	${CC} $+ -o $@

clean:
	rm -rf *.o ksh
	mv ${SRC}/_config.h ${SRC}/config.h

distclean: clean
	rm -rf $(DESTDIR)$(BINDIR)/ksh
	rm -rf $(DESTDIR)$(MANDIR)/man1/ksh.1
	rm -rf $(DESTDIR)$(MANDIR)/man1/sh.1

install: all
	install -m 755 -d $(DESTDIR)$(BINDIR)
	install -m 755 -d $(DESTDIR)$(MANDIR)/man1
	install -m 755 ksh $(DESTDIR)$(BINDIR)
	install -m 644 ${SRC}/ksh.1 $(DESTDIR)$(MANDIR)/man1/ksh.1
	install -m 644 ${SRC}/sh.1 $(DESTDIR)$(MANDIR)/man1/sh.1

# hack because -iquote doesn't work
${SRC}/_config.h:
	mv ${SRC}/config.h ${SRC}/_config.h

.PHONY: all install clean ksh
