/* This file was generated by upb_generator from the input file:
 *
 *     envoy/config/core/v3/substitution_format_string.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/generated_code_support.h"
#include "envoy/config/core/v3/substitution_format_string.upb_minitable.h"
#include "envoy/config/core/v3/base.upb_minitable.h"
#include "envoy/config/core/v3/extension.upb_minitable.h"
#include "google/protobuf/struct.upb_minitable.h"
#include "envoy/annotations/deprecation.upb_minitable.h"
#include "udpa/annotations/status.upb_minitable.h"
#include "validate/validate.upb_minitable.h"

// Must be last.
#include "upb/port/def.inc"

static const upb_MiniTableField envoy_config_core_v3_JsonFormatOptions__fields[1] = {
  {1, 0, 0, kUpb_NoSub, 8, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__config__core__v3__JsonFormatOptions_msg_init = {
  NULL,
  &envoy_config_core_v3_JsonFormatOptions__fields[0],
  8, 1, kUpb_ExtMode_NonExtendable, 1, UPB_FASTTABLE_MASK(8), 0,
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x000000003f000008, &upb_psb1_1bt},
  })
};

static const upb_MiniTableSub envoy_config_core_v3_SubstitutionFormatString_submsgs[4] = {
  {.submsg = &google__protobuf__Struct_msg_init},
  {.submsg = &envoy__config__core__v3__DataSource_msg_init},
  {.submsg = &envoy__config__core__v3__TypedExtensionConfig_msg_init},
  {.submsg = &envoy__config__core__v3__JsonFormatOptions_msg_init},
};

static const upb_MiniTableField envoy_config_core_v3_SubstitutionFormatString__fields[7] = {
  {1, UPB_SIZE(16, 8), -5, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(16, 8), -5, 0, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {3, 1, 0, kUpb_NoSub, 8, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
  {4, 24, 0, kUpb_NoSub, 9, (int)kUpb_FieldMode_Scalar | ((int)kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {5, UPB_SIZE(16, 8), -5, 1, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {6, UPB_SIZE(8, 40), 0, 2, 11, (int)kUpb_FieldMode_Array | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
  {7, UPB_SIZE(12, 48), 1, 3, 11, (int)kUpb_FieldMode_Scalar | ((int)UPB_SIZE(kUpb_FieldRep_4Byte, kUpb_FieldRep_8Byte) << kUpb_FieldRep_Shift)},
};

const upb_MiniTable envoy__config__core__v3__SubstitutionFormatString_msg_init = {
  &envoy_config_core_v3_SubstitutionFormatString_submsgs[0],
  &envoy_config_core_v3_SubstitutionFormatString__fields[0],
  UPB_SIZE(32, 56), 7, kUpb_ExtMode_NonExtendable, 7, UPB_FASTTABLE_MASK(56), 0,
  UPB_FASTTABLE_INIT({
    {0x0000000000000000, &_upb_FastDecoder_DecodeGeneric},
    {0x000800040100000a, &upb_pos_1bt},
    {0x0008000402000012, &upb_pom_1bt_maxmaxb},
    {0x000100003f000018, &upb_psb1_1bt},
    {0x001800003f000022, &upb_pss_1bt},
    {0x000800040501002a, &upb_pom_1bt_maxmaxb},
    {0x002800003f020032, &upb_prm_1bt_maxmaxb},
    {0x003000000103003a, &upb_psm_1bt_max64b},
  })
};

static const upb_MiniTable *messages_layout[2] = {
  &envoy__config__core__v3__JsonFormatOptions_msg_init,
  &envoy__config__core__v3__SubstitutionFormatString_msg_init,
};

const upb_MiniTableFile envoy_config_core_v3_substitution_format_string_proto_upb_file_layout = {
  messages_layout,
  NULL,
  NULL,
  2,
  0,
  0,
};

#include "upb/port/undef.inc"
