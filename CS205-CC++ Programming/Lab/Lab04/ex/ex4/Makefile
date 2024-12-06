CXX = g++
TARGET = testfiles
OBJ = main.o fib.o

CXXFLAGS = -c -Wall

$(TARGET): $(OBJ)
	$(CXX) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

.PHONY : clean
clean:
	rm -f *.o $(TARGET)

SRC = $(wildcard ./*.cpp)
target:
	@echo $(SRC)
CXX = g++
TARGET = testfiles
OBJ = main.o fib.o

CXXFLAGS = -c -Wall

$(TARGET): $(OBJ)
	$(CXX) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

.PHONY : clean
clean:
	rm -f *.o $(TARGET)

SRC = $(wildcard ./*.cpp)
target:
	@echo $(SRC)