#------------------------------------------------
#  # Generic Makefile
# # ------------------------------------------------
#
# # project name (generate executable with this name)
TARGET   = makeupremove
#
CC       = g++
# # compiling flags here
CFLAGS   = -std=c++11
#
LINKER   = g++ -o
# # linking flags here
LFLAGS   = -I. -lm -framework accelerate

opencv = `pkg-config opencv --cflags --libs`

#
# # change these to set the proper directories where each files shoould be
SRCDIR   = src
INCDIR   = include
OBJDIR   = obj
BINDIR   = bin
#
# SOURCES  := $(wildcard $(SRCDIR)/*.c)
SOURCES  := $(wildcard $(SRCDIR)/*.cpp)
INCLUDES := $(wildcard $(INCDIR)/*.h)
OBJECTS  := $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
rm       = rm -f
INC = -I ./include/ -I ./include/linalg/ -I./include/decomp/ -I./include/dictLearn/ -I./include/prox/
LIB =
#
#
$(BINDIR)/$(TARGET): $(OBJECTS)
	@ $(LINKER) $@ $(LFLAGS) $(OBJECTS) $(INC) $(opencv) $(CFLAGS)
	@ echo "Linking complete!"
#
$(OBJECTS): $(OBJDIR)/%.o : $(SRCDIR)/%.cpp
	@ $(CC) $(CFLAGS) $(INC) $(opencv) -c $^ -o $@ 
	@ echo "Compiled "$<" successfully!"
#

.PHONEY: clean
clean:
	@$(rm) $(OBJECTS) $(BINDIR)/$(TARGET)
