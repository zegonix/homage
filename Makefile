ZZ   := zig
COMP := build-exe

NAME := homage
ROOT := main.zig

Z_SRC_DIR := src
C_LIB_DIR := /usr/lib
C_INC_DIR := /usr/include
OUT_DIR   := ./zig-out

C_LIB_NAMES := ncursesw_g

C_INCLUDES   := $(addprefix -I, $(C_INC_DIR))
C_LOCACTIONS := $(addprefix -L, $(C_LIB_DIR))
C_HEADERS    := $(addprefix -l, $(C_LIB_NAMES))

VPATH := ./

.PHONY: all clean test

all: $(OUT_DIR)/$(NAME)

$(OUT_DIR)/$(NAME): $(Z_SRC_DIR)/$(ROOT)
	$(ZZ) $(COMP) $< $(C_INCLUDES) $(C_LOCACTIONS) $(C_HEADERS)

clean:
	-rm -rf $(NAME).o

