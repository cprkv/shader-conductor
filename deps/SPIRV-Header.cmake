# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

add_subdirectory(SPIRV-Headers EXCLUDE_FROM_ALL)

foreach(target "install-headers" "SPIRV-Headers-example")
  set_target_properties(${target} PROPERTIES FOLDER "External/SPIRV-Headers")
endforeach()
