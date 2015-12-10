# Run only on Release builds to ensure that frameworks are stripped
# when archives are sent to iTunes Connect
if [ "${CONFIGURATION}" = "Release" ]; then

	code_sign() {
		echo "Code Signing $1 with Identity ${EXPANDED_CODE_SIGN_IDENTITY_NAME}"
		echo "/usr/bin/codesign --force --sign ${EXPANDED_CODE_SIGN_IDENTITY} --preserve-metadata=identifier,entitlements $1"
		/usr/bin/codesign --force --sign ${EXPANDED_CODE_SIGN_IDENTITY} --preserve-metadata=identifier,entitlements "$1"
	}

	echo "Stripping frameworks"
	cd "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}"

	for file in $(find . -type f -perm +111); do
		if ! [[ "$(file "$file")" == *"dynamically linked shared library"* ]]; then
		continue
		fi

		archs="$(lipo -info "${file}" | rev | cut -d ':' -f1 | rev)"
		stripped=""

		for arch in $archs; do
			if ! [[ "${VALID_ARCHS}" == *"$arch"* ]]; then
				lipo -remove "$arch" -output "$file" "$file" || exit 1
				stripped="$stripped $arch"
			fi
		done

		if [[ "$stripped" != "" ]]; then
			echo "Stripped $file of architectures:$stripped"
			if [ "${CODE_SIGNING_REQUIRED}" == "YES" ]; then
				code_sign "${file}"
			fi
		fi
	done

	if [ "$ACTION" = "install" ]; then
		echo "Copy .bcsymbolmap files to .xcarchive"
		find . -name '*.bcsymbolmap' -type f -exec mv {} "${CONFIGURATION_BUILD_DIR}" \;
	else
		find . -name '*.bcsymbolmap' -type f -exec rm -rf "{}" +\;
	fi
fi