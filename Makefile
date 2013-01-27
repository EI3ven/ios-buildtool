PROJECT_NAME=YOUR_PROJECTNAME_HERE
DIST_LIST=YOUR_TESTFLIGHT_DIST_LIST_HERE
API_TOKEN=YOUR_TESTFLIGHT_API_TOKEN_HERE
TEAM_TOKEN=YOUR_TESTFLIGHT_TEAM_TOKEN_HERE

PROJECT_DIR=..
INFO_PLIST=${PROJECT_DIR}/${PROJECT_NAME}/${PROJECT_NAME}-Info.plist
SCHEME=${PROJECT_NAME}
CONFIGURATION=Debug
BUILD_DIR=build
TARGET_PATH=${BUILD_DIR}/${CONFIGURATION}-iphoneos/${PROJECT_NAME}.app
TARGET_IPA_PATH=${BUILD_DIR}/${CONFIGURATION}-iphoneos/${PROJECT_NAME}.ipa

default: build-app

debug:
	cat scripts/run.applescript | osascript

build-app:
	cd ${PROJECT_DIR} && xcodebuild -configuration ${CONFIGURATION} -scheme ${SCHEME} BUILD_DIR=${BUILD_DIR}
	xcrun -sdk iphoneos PackageApplication ${TARGET_PATH} -o ${TARGET_IPA_PATH}

upload: inc-ver build-app
	scripts/upload-to-testflight.sh ${TARGET_IPA_PATH} ${DIST_LIST} ${API_TOKEN} ${TEAM_TOKEN}

inc-ver:
	scripts/inc-ver.sh ${INFO_PLIST}

clean:
	cd ${PROJECT_DIR} && xcodebuild -configuration ${CONFIGURATION} -scheme ${SCHEME} clean
	rm -rf ${BUILD_DIR}
