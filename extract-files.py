#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)

from extract_utils.fixups_lib import (
    lib_fixups,
    lib_fixups_user_type,
)

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'vendor/amlogic/g12-common',
]

def lib_fixup_system_ext_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'system_ext' else None

def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'libamavutils',
    ): lib_fixup_system_ext_suffix,
    (
        'vendor.amlogic.hardware.subtitleserver@1.0',
        'libvendorfont',
        'libsubtitlebinder',
    ): lib_fixup_vendor_suffix,
}

blob_fixups: blob_fixups_user_type = {
    'system_ext/lib/libvendorfont.so': blob_fixup()
        .add_needed('libcrypto_shim.so'),
    'system_ext/priv-app/droidlogic-res/droidlogic-res.apk': blob_fixup()
        .apktool_patch('blob-patches/droidlogic-res.patch'),
    'vendor/bin/hw/android.hardware.security.keymint-service.amlogic': blob_fixup()
        .replace_needed('lib_android_keymaster_keymint_utils.so', 'lib_android_keymaster_akeymint_utils.so')
        .replace_needed('libkeymint.so', 'libakeymint.so')
        .replace_needed('libkeymint_remote_prov_support.so', 'libakeymint_remote_prov_support.so'),
    'vendor/lib/libakeymint.so': blob_fixup()
        .replace_needed('lib_android_keymaster_keymint_utils.so', 'lib_android_keymaster_akeymint_utils.so'),
    'vendor/lib/libakeymint_remote_prov_support.so': blob_fixup()
         .replace_needed('libcppcose_rkp.so', 'libacppcose_rkp.so')
         .replace_needed('libbase.so', 'libbase-v33.so'),
    'vendor/lib/egl/libGLES_mali.so': blob_fixup()
        .replace_needed('android.hardware.graphics.common-V4-ndk.so', 'android.hardware.graphics.common-V7-ndk.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'dopinder',
    'askey',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    add_firmware_proprietary_file=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, '../amlogic/g12-common', module.vendor)
    utils.run()
