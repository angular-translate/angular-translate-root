#!/bin/bash

export C_BOLD=`tput bold`
export C_RED=`tput setaf 1`
export C_GREEN=`tput setaf 2`
export C_GRAY=`tput setaf 7`
export C_RESET=`tput sgr0`
export C_LINE=`tput el`

echo -e "${C_RESET}"
echo "Checking repositories..."
for repositoryId in $(cat git-repositories.json | jq -r '.repositories | keys[]'); do
	if [ ! -d repo/$repositoryId ]; then
		repositoryUrl=`cat git-repositories.json | jq -r ".repositories[\"$repositoryId\"].url"`
		echo -e "-> Cloning repository ${C_BOLD}${repositoryId}${C_RESET} [${repositoryUrl}]..."
		echo -en "${C_GRAY}"
		git clone "${repositoryUrl}" "repo/${repositoryId}"
		echo -e "${C_RESET}"
	else
		echo -e "-> Fetching repository ${C_BOLD}${repositoryId}${C_RESET}..."
		pushd repo/$repositoryId > /dev/null
		git fetch
		popd > /dev/null
		echo -e "${C_RESET}"
	fi
done

echo -e "${C_RESET}"
echo "Apply local Git config..."
for configKey in $(cat git-config.json | jq -r '.config | keys[]'); do
	configVal=`cat git-config.json | jq -r ".config[\"$configKey\"]"`
	echo " - Setting ${C_BOLD}${configKey}${C_RESET}"
	# for myself
	git config --local $configKey "${configVal}"
	# for all repo
	for d in repo/*; do
		if [[ -d ${d} && ${d}/.git ]]; then
			pushd ${d}/.git > /dev/null
			git config --local $configKey "${configVal}"
			popd > /dev/null
		fi
	done
done
echo " Done."

echo -e "${C_RESET}"
