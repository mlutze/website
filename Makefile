FLIX_SRC := $(shell find src -type f)
RESOURCES := $(shell find resources -type f)

.PHONY: all build clean deploy

all: build

build: public_html/

# deploys to the server
deploy: build
	scp -r public_html/ au702114@linuxapp.au.dk:/var/www/au702114/

# clears the build folders
clean:
	rm -rf build
	rm -rf artifact
	rm -rf public_html

artifact/website.jar: $(FLIX_SRC)
	java -jar flix.jar build
	java -jar flix.jar build-jar

public_html/: $(RESOURCES) artifact/website.jar
	mkdir -p public_html
	touch public_html
	java -jar artifact/website.jar public_html/index.html
	cp resources/* public_html/
