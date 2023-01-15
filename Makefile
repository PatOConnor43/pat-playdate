.PHONY: clean
.PHONY: build
.PHONY: run

SDKBIN=$(PLAYDATE_SDK_PATH)/bin
GAME=$(notdir $(CURDIR))
SIM=PlaydateSimulator


build: clean compile run

run: open

clean:
	rm -rf '$(GAME).pdx'

compile: source/main.lua
	"$(SDKBIN)/pdc" 'source' '$(GAME).pdx'
	
open:
	'$(SDKBIN)/$(SIM)' '$(GAME).pdx'
