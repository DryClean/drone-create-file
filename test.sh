git clone https://github.com/ZombieHippie/fantastic-repository
cd fantastic-repository
git checkout feature/test-feature
git clean -f

PLUGIN_OUT='drone-comments/linting'
PLUGIN_IF='/\w+/.test(`$(cat reports/tslint-prose.txt)`)'
PLUGIN_BODY='"**Linting Errors Found**\n```txt\n$(cat reports/tslint-prose.txt)\n```"'

docker run --rm                \
	 -e PLUGIN_OUT=$PLUGIN_OUT   \
	 -e PLUGIN_IF=$PLUGIN_IF     \
	 -e PLUGIN_BODY=$PLUGIN_BODY \
	 -v $(pwd):$(pwd)            \
	 -w $(pwd)                   \
	 dryclean/drone-write-file

cd ..
