# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

if(EXISTS cxxopts)
  include(cxxopts.cmake)
endif()

if(EXISTS cxxopts)
  include(googletest.cmake)
endif()

include(SPIRV-Header.cmake)
include(SPIRV-Tools.cmake)
include(DirectXShaderCompiler.cmake)
include(SPIRV-Cross.cmake)
