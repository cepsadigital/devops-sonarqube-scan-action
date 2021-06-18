#!/bin/bash

BRANCH_FULL=${GITHUB_REF}
BRANCH=${BRANCH_FULL/refs\/heads\//""}

if [[ "${INPUT_CHECKQUALITYGATE}" == "true" ]]; then
	sonar-scanner \
		-Dsonar.host.url=${INPUT_HOST} \
    		-Dsonar.projectBaseDir=${INPUT_PROJECTBASEDIR} \
    		-Dsonar.login=${INPUT_LOGIN} \
    		-Dsonar.password=${INPUT_PASSWORD} \
		-Dsonar.branch.name=${BRANCH} \
		-Dsonar.qualitygate.wait \
		-Dsonar.qualitygate.timeout=300
else
	sonar-scanner \
		-Dsonar.host.url=${INPUT_HOST} \
    		-Dsonar.projectBaseDir=${INPUT_PROJECTBASEDIR} \
    		-Dsonar.login=${INPUT_LOGIN} \
    		-Dsonar.password=${INPUT_PASSWORD} \
		-Dsonar.branch.name=${BRANCH}
fi
