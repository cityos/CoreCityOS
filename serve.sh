if [ -d CoreCityOS ]; then
  git -C CoreCityOS pull origin master
else
  git clone --depth 1 --branch master https://github.com/cityos/CoreCityOS.git
fi

jazzy --clean --output master --module-version master --theme fullwidth
