TEXT_OFFSET    = 0xc000
VECTORS_OFFSET = 0xffe0

ASFLAGS += -g
LDFLAGS += \
	--section-start=.text=$(TEXT_OFFSET) \
	--section-start=.vectors=$(VECTORS_OFFSET)

ELF    = uart-echo
OBJECT = uart-echo.o
SOURCE = uart-echo.s

$(ELF): $(OBJECT)
	$(LD) -o $(ELF) $(OBJECT) $(LDFLAGS)

$(OBJECT): $(SOURCE)
	$(AS) -o $(OBJECT) $(SOURCE) $(ASFLAGS)

clean:
	$(RM) $(ELF) $(OBJECT)
