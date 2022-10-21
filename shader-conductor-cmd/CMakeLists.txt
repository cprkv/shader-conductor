# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

project(shader-conductor-cmd)

add_executable(${PROJECT_NAME} ShaderConductorCmd.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE shader-conductor cxxopts)
sc_setup_compiler(${PROJECT_NAME})
