BUILDER ?= gprbuild -p -gnat12 -gnata
FLAGS ?=
ifeq (${DEBUG}, True)
	FLAGS +=  -gnata -ggdb -g 
else
	DEBUG = False
endif
NAME = $(shell basename ${PWD})
PROJECT ?= adauuid
DESTDIR ?= 
prefix ?= /usr/local
libdir ?= ${prefix}/lib
bindir ?= ${prefix}/bin
includedir ?= ${prefix}/include
gprdir ?= ${prefix}/share/gpr
VERSION = 0.1


all: build
debug :clean build_debug
check_syntax: clean build_syntax
warn: clean build_all_warnings
strip: clean build_strip
prof: clean build_prof
libs: build_libs
.PHONY : install


build_libs: 
	${BUILDER} -P gnat/${PROJECT}_libs_build  ${FLAGS}

test: build_libs 
	${BUILDER} -P gnat/${PROJECT}_tests_build  ${FLAGS}
	./bin/adauuid_harness

build_tools: build_libs 
	${BUILDER} -P gnat/${PROJECT}_tools_build  ${FLAGS}

build: build_libs build_tools

clean:
	gnat clean -P gnat/${PROJECT}_libs_build
	gnat clean -P gnat/${PROJECT}_tools_build
	## and control shoot to the head...
	rm -rf bin/ obj/ lib/  tmp/ 

install:
	install -d -m 0755 ${DESTDIR}/${libdir}/${PROJECT}
	install -d -m 0755 ${DESTDIR}/${includedir}/${PROJECT}
	install -d -m 0755 ${DESTDIR}/${gprdir}
	install -d -m 0755 ${DESTDIR}/${bindir}
	install -d -m 0755 ${DESTDIR}/${prefix}/share/doc/${PROJECT}/examples
	cp -r lib/*.ali ${DESTDIR}/${libdir}/${PROJECT}
	cp -r lib/*.so* ${DESTDIR}/${libdir}/${PROJECT}
	cp -r src/* ${DESTDIR}/${includedir}/${PROJECT}
	cp -r install/${PROJECT}.gpr ${DESTDIR}/${gprdir}
	cp -r examples ${DESTDIR}/${prefix}/share/doc/${PROJECT}/examples

	cd ${DESTDIR}/${libdir} && ln -s ${PROJECT}/*.so* .

clean_rpm:
	rm -rf ${HOME}/rpmbuild/SOURCES/${NAME}-${VERSION}.tgz
	rm  -f packaging/${NAME}-build.spec
	find ${HOME}/rpmbuild -name "${NAME}*.rpm" -exec rm -f {} \; 

rpm: clean_rpm
	git archive --prefix=${NAME}-${VERSION}/ -o ${HOME}/rpmbuild/SOURCES/${NAME}-${VERSION}.tar.gz HEAD
	sed "s/@RELEASE@/`date +%s`/;s/@DEBUG@/${DEBUG}/" packaging/Fedora.spec > packaging/${NAME}-build.spec
	rpmbuild -ba packaging/${NAME}-build.spec
	rm -f packaging/${NAME}-build.spec

repo: clean_rpm rpm
	find ${HOME}/rpmbuild -name "${NAME}*.rpm" -exec cp {} /mnt/share/landgraf/repos/  \; 
	createrepo /mnt/share/landgraf/repos/

