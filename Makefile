BIN := node_modules/.bin
TYPESCRIPT := index.ts

all: $(TYPESCRIPT:%.ts=%.js) $(TYPESCRIPT:%.ts=%.d.ts) .npmignore .gitignore

.npmignore: tsconfig.json
	echo $(TYPESCRIPT) demo/ Makefile tsconfig.json | tr ' ' '\n' > $@

.gitignore: tsconfig.json
	echo $(TYPESCRIPT:%.ts=%.js) $(TYPESCRIPT:%.ts=%.d.ts) | tr ' ' '\n' > $@

$(BIN)/tsc:
	npm install

%.js %.d.ts: %.ts $(BIN)/tsc
	$(BIN)/tsc -d
