
SHELL := /usr/bin/env bash

ZZ   := zig
COMP := build-exe

OPT_LVL_DBG := -O Debug
OPT_LEVEL := $(OPT_LVL_DBG)

LF := -flld --gc-sections --verbose-link

ZBEF := -target x86_64-linux-gnu $(OPT_LEVEL) $(LF)

NAME := homage
ROOT := main.zig

Z_SRC_DIR := src
C_LIB_DIR := /usr/lib
C_INC_DIR := /usr/include
BIN_DIR   := ./bin

BINARY := $(BIN_DIR)/$(NAME)

C_LIB_NAMES := c ncursesw panelw menuw

C_INCLUDES   := $(addprefix -I, $(C_INC_DIR))
C_LOCACTIONS := $(addprefix -L, $(C_LIB_DIR))
C_LIBS       := $(addprefix -l, $(C_LIB_NAMES))

MKDIRS := $(BIN_DIR)

VPATH := ./


.PHONY: all clean test


all: $(BIN_DIR) $(BINARY)


$(MKDIRS):
	mkdir -p $@


$(BINARY): $(Z_SRC_DIR)/$(ROOT)
	$(ZZ) $(COMP) $(ZBEF) \
          $(C_INCLUDES) $(C_LOCACTIONS) $(C_LIBS) \
          --name $(NAME) -Mroot=$<
	rm -f $(NAME).o
	mv $(NAME) $(dir $@)


clean:
	-rm -rf $(MKDIRS)

