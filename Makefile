BRANCH := gh-pages
FOLDER := public

all: prepare build deploy clean

prepare: clean
	echo "Adding the work tree"
	git worktree add $(FOLDER) $(BRANCH)

build:
	echo "Building"
	hugo -D
	sed  -i '/meta name="generator"/d' public/index.html

deploy:
	echo "Deploying"
	cd $(FOLDER) && \
	git add --all && \
	git commit -m "Deploy" && \
	git push origin $(BRANCH)

clean:
	echo "Cleaning"
	git worktree remove --force $(FOLDER)
	rm -rf $(FOLDER)
