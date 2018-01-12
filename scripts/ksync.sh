#!/bin/sh

my_name="${0##*/}"

if [ -z "$IDF_PATH" ]; then
  echo "please set IDF_PATH"
  exit 1
fi

k_dir=$IDF_PATH

# Sync-up the files
k_files=""
while read k_file trash kf_file; do
    k_files="${k_files} ${k_file}"
    echo "Syncing ${k_files} -> ${kf_file}"
    mkdir -p "${kf_file%/*}"
    cp -v "${k_dir}/${k_file}" "${kf_file}"
    if [ -f "${kf_file}.patch" ]; then
        patch --no-backup-if-mismatch -g0 -F1 -p1 -f <"${kf_file}.patch"
    fi
done <scripts/ksync.list
