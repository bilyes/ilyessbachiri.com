all: prepare build deploy clean

prepare: clean
	echo "Adding the work tree"
	git worktree add public gh-pages

build:
	echo "Building"
	hugo -D
	sed  -i '/meta name="generator"/d' public/index.html

deploy:
	echo "Deploying"
	cd public && \
	git add --all && \
	git commit -m "Deploy" && \
	git push origin gh-pages

clean:
	echo "Cleaning"
	git worktree remove public
	rm -rf public
