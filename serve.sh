# Fetch newest version from Github
if [ -d CoreCityOS ]; then
  git -C CoreCityOS pull origin master
else
  git clone --depth 1 --branch master https://github.com/cityos/CoreCityOS.git
fi

# Generate docs in folder master
jazzy --clean --output master --module-version master --theme fullwidth --head "$(cat head.html)"

