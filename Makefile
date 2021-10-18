init:
	docker build ./ -t gitbook

template:
	docker run \
		-v $(PWD)/docs:/app/docs \
		-it gitbook \
		npx gitbook init ./docs

serve:
	docker run \
		-d \
		-v $(PWD)/docs:/app/docs \
		-p 4000:4000 \
		-it gitbook \
		npx gitbook serve ./docs

logs:
	docker logs -f  `docker ps | grep gitbook | awk '{print $$1}'`

stop:
	docker kill `docker ps | grep gitbook | awk '{print $$1}'`

build:
	docker run \
		-v $(PWD)/docs:/app/docs \
		-it gitbook \
		npx gitbook build ./docs

build.pdf:
	docker run \
		-v $(PWD)/docs:/app/docs \
		-it gitbook \
		npx gitbook pdf ./docs ./docs/book.pdf

##
## develop docker environment
##
_run:
	docker run -v $(PWD):/app -it gitbook /bin/sh
