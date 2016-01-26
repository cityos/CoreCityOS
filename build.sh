#!/bin/sh

set -o pipefail
set -e

usage() {
cat <<EOF
Usage: sh $0 command

command:
	clean:			clean up/remove all generated files
	build:			build all iOS, OSX and tvOS frameworks
	ios:			build iOS framework
	tvOS:			build tvOS framework
	osx: 			build OSX framework
	test:			test all iOS, OSX and tvOS frameworks
	test-ios:		test iOS build
	test-osx:		test OSX build
	test-tvOS:		test tvOS build
	docs: 			build docs in docs/output using jazzy

environment variables:
	CONFIGURATION: 		Debug or Release (default)
EOF
}

CONFIGURATION="Debug"
export CONFIGURATION

COMMAND="$1"

case "$COMMAND" in

	# Clean
	"clean")
        find . -type d -name build -exec rm -r "{}" +\;
        exit 0
        ;;

    "docs")
		jazzy \
		--clean \
		--author "CityOS" \
		--author_url "http://cityos.io"\
		--github_url "https://github.com/cityos/CoreCityOS" \
		--theme "fullwidth"
		exit 0
	;;
esac

usage