DLLTOOLEXTRA := $(PLATDIR)/../processors/IA32/winbochs/cpu/libcpu.a \
				$(PLATDIR)/../processors/IA32/winbochs/fpu/libfpu.a \
				$(PLATDIR)/../processors/IA32/winbochs/disasm/libdisasm.a
DLLWRAPEXTRA := $(DLLTOOLEXTRA)

LINK_WITH_GPP := yes
EXTRALIBS:= -L$(PLATDIR)/../processors/IA32/winbochs/cpu \
			-L$(PLATDIR)/../processors/IA32/winbochs/fpu \
			-L$(PLATDIR)/../processors/IA32/winbochs/disasm \
			-lcpu -lfpu -ldisasm

include ../../Makefile.plugin

CXXINCLUDES:= -I$(PLATDIR)/../processors/IA32/winbochs \
			  -I$(PLATDIR)/../processors/IA32/bochs \
			  -I$(PLATDIR)/../processors/IA32/bochs/instrument/stubs

CXXFLAGS:=	-m32 -mno-cygwin -DWIN32 -msse2 -ggdb2 -mwindows -mthreads -mwin32 \
			-mno-rtd -mms-bitfields -mno-accumulate-outgoing-args

.cpp.o:
		$(CXX) -c $(CXXFLAGS) $(CXXINCLUDES) $<

CXX:=g++
