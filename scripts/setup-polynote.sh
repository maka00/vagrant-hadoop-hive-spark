#!/bin/bash

source "/vagrant/scripts/common.sh"

function setupEnvVars {
	echo "creating polynote environment variables"
}

function setupPolynote {
	echo "Polynote download"
	curl ${CURL_OPTS} -o /home/vagrant/${POLYNOTE_ARCHIVE}  -O -L ${POLYNOTE_DONWLOAD}
    tar -zxvpf ${POLYNOTE_ARCHIVE} 
    cd polynote 
    cp ${POLYNOTE_RES_DIR}/config.yml .
    ln -s /home/vagrant/polynote/polynote-start ..
    chown -R vagrant polynote
    chown -R vagrant ../polynote-start
    setsid ./polynote > /var/log/polynote.log 2>&1 < /dev/null &
}

echo "Polynote setup"
setupEnvVars
setupPolynote