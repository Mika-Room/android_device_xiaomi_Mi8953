#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function patchelf_add_needed() {
    local LOCAL_PATCHELF="${PATCHELF}"
    [ -x "${3}" ] && LOCAL_PATCHELF="${3}"
    if ! "${LOCAL_PATCHELF}" --print-needed "${2}" | grep -q "${1}"; then
        "${LOCAL_PATCHELF}" --add-needed "${1}" "${2}"
    fi
}

function blob_fixup() {
    # For all ELF files
    if [[ "${1}" =~ ^.*(\.so|\/bin\/.*)$ ]]; then
        "${PATCHELF_0_17_2}" --replace-needed "libstdc++.so" "libstdc++_vendor.so" "${2}"
    fi
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=Mi8953
export DEVICE_COMMON=mithorium-common
export VENDOR=xiaomi

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"