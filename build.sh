#!/bin/sh

set -o pipefail
set -e

PROJECT="CoreCityOS.xcodeproj"
OSX_SCHEME="CoreCityOS OSX"
IOS_SCHEME="CoreCityOS iOS"
TVOS_SCHEME="CoreCityOS tvOS"

IOS_SDK="iphonesimulator9.2"
OSX_SDK="macosx10.11"
TVOS_SDK="appletvsimulator9.1"

IOS_DESTINATION="OS=9.2,name=iPhone 6S Plus"
OSX_DESTINATION="arch=x86_64"
TVOS_DESTINATION="OS=9.1,name=Apple TV 1080p"

usage() {
cat <<EOF
Usage: sh $0 command

command:
	clean			clean up/remove all generated files
	all				build all iOS, OSX and tvOS frameworks
	ios				build iOS framework
	tvOS			build tvOS framework
	osx 			build OSX framework
	test			test all iOS, OSX and tvOS frameworks
	test-ios		test iOS build
	test-osx		test OSX build
	test-tvOS		test tvOS build
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
		git checkout gh-pages &&
		sh serve.sh &&
		git checkout master
		exit 0
	;;

	"ios")
		xcodebuild clean -project $PROJECT -scheme "${IOS_SCHEME}" -sdk "${IOS_SDK}" -destination "${IOS_DESTINATION}" -configuration Debug ONLY_ACTIVE_ARCH=NO build | xcpretty -c
		exit 0
	;;

	"osx")
		xcodebuild clean -project $PROJECT -scheme "${OSX_SCHEME}" -sdk "${OSX_SDK}" -destination "${OSX_DESTINATION}" -configuration Debug ONLY_ACTIVE_ARCH=NO build | xcpretty -c
		exit 0
	;;

	"tvOS")
		xcodebuild clean -project $PROJECT -scheme "${TVOS_SCHEME}" -sdk "${TVOS_SDK}" -destination "${TVOS_DESTINATION}" -configuration Debug ONLY_ACTIVE_ARCH=NO build | xcpretty -c
		exit 0
	;;

	"all")
		echo "Building iOS version"
		sh build.sh ios
		echo "\nBuilding tvOS version"
		sh build.sh tvOS
		echo "\nBuilding OS X version"
		sh build.sh osx
		exit 0
	;;

	"test-ios")
		xcodebuild clean -project $PROJECT -scheme "${IOS_SCHEME}" -sdk "${IOS_SDK}" -destination "${IOS_DESTINATION}" -configuration Debug ONLY_ACTIVE_ARCH=NO test | xcpretty -c
		exit 0
	;;

	"test-osx")
		xcodebuild clean -project $PROJECT -scheme "${OSX_SCHEME}" -sdk "${OSX_SDK}" -destination "${OSX_DESTINATION}" -configuration Debug ONLY_ACTIVE_ARCH=NO test | xcpretty -c
		exit 0
	;;

	"test-tvOS")
		xcodebuild clean -project $PROJECT -scheme "${TVOS_SCHEME}" -sdk "${TVOS_SDK}" -destination "${TVOS_DESTINATION}" -configuration Debug ONLY_ACTIVE_ARCH=NO test | xcpretty -c
		exit 0
	;;

	"test")
		echo "Testing iOS version"
		sh build.sh test-ios
		echo "\nTesting tvOS version"
		sh build.sh test-tvOS
		echo "\nTesting OS X version"
		sh build.sh test-osx
		exit 0
	;;
esac

usage