all: _build-go _build-java _run clean

_build-go:
	@go build -o ifgo main.go

_build-java:
	@javac Main.java

_run: _build-go _build-java
	@echo '[Go  ]----------------------------------------------'
	@./ifgo
	@echo '[Java]----------------------------------------------'
	@java -cp .. interface_behavior_compare.Main
	@echo '----------------------------------------------------'

clean:
	rm -f *.class
	rm ./ifgo