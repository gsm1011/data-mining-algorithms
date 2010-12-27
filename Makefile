CPP = /usr/bin/g++
#MACROS += -DDEBUG_DATA_LOAD
#MACROS += -DDEBUG_DATA_LOADI
#MACROS += -DDEBUG_ITEM_MAP
#MACROS += -DDEBUG_ITEMSET_COMPARE
#MACROS += -DDEBUG_LEVEL_TWO
#MACROS += -DDEBUG_APRIORI
#MACROS += -DDEBUG_ASSORULE
#MACROS += -DDEBUG_APRIORI_JOIN
#MACROS += -DDEBUG_APRIORI_PRUNE
#MACROS += -DDEBUG_APRIORI_SCAN
#MACROS += -DDEBUG_HASH_INSERT
#MACROS += -DDEBUG_ASSORULE_PRINT
#MACROS += -DDEBUG_HASH_INSERTSET
#MACROS += -DDEBUG_APRIORI_TRAVERSAL

CPPFLAGS = -O2 $(MACROS)
LD = /usr/bin/ld
LDFLAGS = -L/usr/lib -L/lib
RM = /bin/rm -rf
EXECUTABLE = AssoRuleMiner
DOX = /usr/bin/doxygen
DOXCONF = Doxygen

SRC = main.cpp DataSet.cpp Itemset.cpp AssoRule.cpp 

OBJ = $(SRC:.cpp=.o)

all: $(EXECUTABLE)

.SUFFIX: .o .cpp

$(EXECUTABLE): $(OBJ)
	$(CPP) $(LDFLAGS) $^ -o $@

.o: .cpp
	$(CPP) -c $(CPPFLAGS) $< -o $@

doc: $(DOXCONF) $(SRC)
	@$(DOX) $<

clean:
	@$(RM) $(OBJ) $(EXECUTABLE)