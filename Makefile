##
## Makefile for  in /home/hazer/Documents/tek2/asm_minilibc
## 
## Made by hazer
## Login   <hazer@epitech.net>
## 
## Started on  Thu Mar 23 16:18:24 2017 hazer
## Last update Sun Mar 26 21:41:02 2017 hazer
##

NASM		= nasm -f elf64

CC		= ld

SRC		= src/strlen.asm	\
		  src/strchr.asm	\
		  src/strncmp.asm	\
		  src/strcmp.asm	\
		  src/memset.asm	\
		  src/memcpy.asm	\
		  src/strcasecmp.asm	\
		  src/rindex.asm	\

OBJ		= $(SRC:.asm=.o)

TARGET		= libasm.so

all:		$(TARGET)

$(TARGET):	$(OBJ)
		@$(CC) -shared -fPIC -o $(TARGET) $(OBJ)
		@echo $(TARGET)" compiled !"

%.o:		%.asm
		@$(NASM) -o $@ $<

clean:
		@rm -f $(OBJ)
		@echo "Object files deleted"

fclean:		clean
		@rm -f $(TARGET)
		@echo "Library deleted"

re:		fclean all
