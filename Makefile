build:
	@docker build -t dqminh/jjb .
.PHONY: build

run: build
	# this expects a jenkins container to be run with jenkins name
	@docker run --rm --link jenkins:jenkins -v $(CURDIR):/jobs dqminh/jjb
.PHONY: run
