CC     = gcc
CFLAGS = -Wall -Werror -g
TARGET = szotar
SRC    = $(wildcard src/*.c)
OBJ    = $(patsubst src/%.c,build/%.o,$(SRC))

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

build/%.o: src/%.c
	@mkdir -p build
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

run: $(TARGET)
	./$(TARGET)

clean:
	rm -rf build $(TARGET)

-include $(OBJ:.o=.d)
.PHONY: all run clean