docker run --rm                \
	 --env-file ./x-and-o.env    \
	 -v $(pwd):$(pwd)            \
	 -w $(pwd)                   \
	 dryclean/drone-write-file
