
CROSS_COMPILE = arm-none-eabi-

# Use our cross-compile prefix to set up our basic cross compile environment.
CC      = $(CROSS_COMPILE)gcc
LD      = $(CROSS_COMPILE)ld
OBJCOPY = $(CROSS_COMPILE)objcopy

CFLAGS = \
	-mtune=arm7tdmi \
	-mlittle-endian \
	-fno-stack-protector \
	-fno-common \
	-fno-builtin \
	-ffreestanding \
	-std=gnu99 \
	-Werror \
	-Wall \
	-Wno-error=unused-function \
	-fomit-frame-pointer \
	-g \
	-Os \

LDFLAGS =

all: intermezzo.bin

# The new address of the Intermezzo after copy
INTERMEZZO_RELOCATED_ADDRESS := 0x4000F000

# The address to which Intermezzo is to be loaded by the payload launcher.
INTERMEZZO_ADDRESS := 0x40010000

# The address we want the final payload to be located at.
RELOCATION_TARGET  := 0x40010000

# The addrss and length of the data loaded by f-g.
PAYLOAD_START_ADDR  := 0x40010E40
STACK_SPRAY_START   := 0x40014E40
STACK_SPRAY_END     := 0x40017000
BEFORE_SPRAY_LENGTH := $(shell echo $$(( $(STACK_SPRAY_START) - $(PAYLOAD_START_ADDR) )))
AFTER_SPRAY_LENGTH  := 0x30000

ENTRY_POINT_ADDRESS := 0x40010000

# Provide the definitions used in the intermezzo stub.
DEFINES := \
	-DINTERMEZZO_RELOCATED_ADDRESS=$(INTERMEZZO_RELOCATED_ADDRESS) \
	-DRELOCATION_TARGET=$(RELOCATION_TARGET) \
	-DPAYLOAD_START_ADDR=$(PAYLOAD_START_ADDR) \
	-DSTACK_SPRAY_START=$(STACK_SPRAY_START) \
	-DSTACK_SPRAY_END=$(STACK_SPRAY_END) \
	-DBEFORE_SPRAY_LENGTH=$(BEFORE_SPRAY_LENGTH) \
	-DAFTER_SPRAY_LENGTH=$(AFTER_SPRAY_LENGTH) \
	-DENTRY_POINT_ADDRESS=$(ENTRY_POINT_ADDRESS)

intermezzo.elf: intermezzo.o
	$(LD) -T intermezzo.lds --defsym LOAD_ADDR=$(INTERMEZZO_ADDRESS) $(LDFLAGS) $^ -o $@

intermezzo.o: intermezzo.S
	$(CC) $(CFLAGS32) $(DEFINES) $< -c -o $@

%.bin: %.elf
	$(OBJCOPY) -v -O binary $< $@

clean:
	rm -f *.o *.elf *.bin

.PHONY: all clean
