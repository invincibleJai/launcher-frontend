#!/usr/bin/bash

JSON_SETTINGS_TEMPLATE="/usr/bin/settings-tmpl.json"
INDEX="/usr/share/nginx/html/launch/index.html"

# process and export json settings from given template (escape double quotes, remove spaces and line breaks)
export LAUNCHER_JSON_SETTINGS="$(envsubst < ${JSON_SETTINGS_TEMPLATE} | tr -d '[:space:]' | sed 's/\"/\\\"/g')"

echo LAUNCHER_JSON_SETTINGS=${LAUNCHER_JSON_SETTINGS}

# create injected index.html with json settings
envsubst < ${INDEX} > ${INDEX}.tmp
mv -f ${INDEX}.tmp ${INDEX}
echo -------------------------------------
cat ${INDEX}

exec /run.sh
