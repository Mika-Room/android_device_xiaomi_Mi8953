/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_dalvik_heap.h>
#include <libinit_variant.h>

#include "vendor_init.h"

#include <android-base/file.h>

static const variant_info_t ysl_info = {
    .brand = "Xiaomi",
    .device = "ysl",
    .marketname = "",
    .model = "Redmi S2",
    .build_fingerprint = "",
};

static const variant_info_t vince_info = {
    .brand = "Xiaomi",
    .device = "vince",
    .marketname = "",
    .model = "Redmi 5 plus",
    .build_fingerprint = "",
};

static const variant_info_t mido_info = {
    .brand = "Xiaomi",
    .device = "mido",
    .marketname = "",
    .model = "Redmi Note 4",
    .build_fingerprint = "",
};

static void determine_device()
{
    std::string codename;

    android::base::ReadFileToString("/sys/xiaomi-msm8953-mach/codename", &codename, true);
    if (codename.empty())
        return;
    codename.pop_back();

    if (codename == "ysl") {
        set_variant_props(ysl_info);
    } else if (codename == "vince") {
        set_variant_props(vince_info);
    } else if (codename == "mido") {
        set_variant_props(mido_info);
    }

    return;
}

void vendor_load_properties() {
    determine_device();
    set_dalvik_heap();
}