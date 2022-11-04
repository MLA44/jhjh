NAME        := Buffer
CXX         := g++-11
CXXFLAGS    := -std=c++2a

SRC_DIR		:= .
LIBS        := -I.

SRCS        := ./main.cpp
OBJS        := $(SRCS:%.cpp=%.o)

.PHONY: all

build-libsodium:
	ls -la
	./libsodium-stable/configure
	cd libsodium-stable && make && make check
	cd libsodium-stable && sudo make install

$(NAME): $(OBJS)
	$(CXX) -o $@ $^ $(LIBS)

$(OBJS): $(SRC_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $< $(LIBS)