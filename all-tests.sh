

function RunTests {
	docker run --rm             \
		--env-file $(ls ./*.env)  \
		-e PLUGIN_DEBUG=1					\
		-v $(pwd):$(pwd)          \
		-w $(pwd)                 \
		dryclean/drone-write-file


	diff *.expected *.out
}

PREV_WORKING_DIR=$(pwd)
echo "All Tests"
echo "======"

for FOLDER in $(ls -d tests/*/)
do
	cd $FOLDER
	echo "## Test:" $FOLDER
	rm $(ls ./*.out) > /dev/null
	RunTests
	cd $PREV_WORKING_DIR
done
