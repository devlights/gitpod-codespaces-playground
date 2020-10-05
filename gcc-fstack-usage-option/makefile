CC = gcc
CFLAGS = -g -Wall -Wextra -fstack-usage

EXE = fstack-usage-example

all: _compile _run _view-su _clean

_compile:
	$(CC) $(CFLAGS) -o $(EXE) ./*.c

_run:
	@./$(EXE)

_view-su:
	@find . -name "*.su" -type f | xargs cat | awk -F" " '{printf("%-60s\t%d\t%s\n", $$1, $$2, $$3)}'

_clean:
	@$(RM) ./$(EXE)
	@$(RM) ./*.su
