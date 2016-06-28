function RunTests {
	docker run --rm             \
		--env-file $(ls ./*.env)  \
		-e PLUGIN_DEBUG=1					\
		-v $(pwd):$(pwd)          \
		-w $(pwd)                 \
		dryclean/drone-write-file

	if [ -f *.expected ] && [ -f ./**/*.out ]; then
		diff *.expected ./**/*.out
	fi
}

PREV_WORKING_DIR=$(pwd)
echo "All Tests"
echo "======"

for FOLDER in $(ls -d tests/*/)
do
	cd $FOLDER
	echo -e "## Test\e[1m" $FOLDER "\e[0m"
	if [ -f ./**/*.out ]; then
		rm "$(ls ./**/*.out)" > /dev/null
	fi
	RunTests
	echo -e "\e[92mdone\e[0m."
	cd $PREV_WORKING_DIR
done
