BIN := node_modules/.bin

all: dropdown.d.ts index.js

$(BIN)/tsc:
	npm install

dropdown.d.ts: index.ts $(BIN)/tsc
	sed 's:^//// ::g' $< > module.ts
	$(BIN)/tsc --module commonjs --target ES5 --declaration module.ts
	sed 's:export declare module dropdown:declare module "dropdown":' <module.d.ts >$@
	rm module.{ts,d.ts,js}
