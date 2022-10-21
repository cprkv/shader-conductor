# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

add_subdirectory(SPIRV-Cross EXCLUDE_FROM_ALL)

foreach(target
    "spirv-cross" "spirv-cross-core" "spirv-cross-cpp" "spirv-cross-glsl" "spirv-cross-hlsl"
    "spirv-cross-msl" "spirv-cross-reflect" "spirv-cross-util")
  set_target_properties(${target} PROPERTIES FOLDER "External/SPIRV-Cross")
endforeach()

foreach(target "SPIRV-Tools-static" "SPIRV-Tools-opt")
  set_target_properties(${target} PROPERTIES FOLDER "External/SPIRV-Tools/SPIRV-Tools libraries")
endforeach()
