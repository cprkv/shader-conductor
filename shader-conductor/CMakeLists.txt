# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

project(shader-conductor)

# TODO (vadik)

# if(WIN32)
#   set(` "dxcompiler.dll")
#   set(runtimeOutputFolder "bin")
#   #set(copyTargetFolder ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
#   set(copyTargetFolder ${SC_BUILD_DIR}/Bin)
# else()
#   if(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
#     set(dxcompilerName "libdxcompiler.dylib")
#   else()
#     set(dxcompilerName "libdxcompiler.so")
#   endif()
#   set(runtimeOutputFolder "lib")
#   set(copyTargetFolder ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
# endif()

# set(dxcompilerOutput "${copyTargetFolder}/${CMAKE_CFG_INTDIR}/${dxcompilerName}")

# add_custom_target(CopyDxcompiler ALL
#   COMMAND ${CMAKE_COMMAND} -E copy
#     ${SC_BUILD_DIR}/External/DirectXShaderCompiler/${CMAKE_CFG_INTDIR}/${runtimeOutputFolder}/${dxcompilerName}
#     ${dxcompilerOutput}
#   COMMENT "Copying dxcompiler...")
# add_dependencies(CopyDxcompiler dxcompiler)

add_library(${PROJECT_NAME} "SHARED" ShaderConductor.cpp ShaderConductor.hpp)

target_include_directories(${PROJECT_NAME}
  PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
  PRIVATE
    ${SC_BUILD_DIR}/deps/DirectXShaderCompiler/include
    ${SC_ROOT_DIR}/deps/DirectXShaderCompiler/include
)

target_compile_definitions(${PROJECT_NAME} PRIVATE -DSHADER_CONDUCTOR_SOURCE)

target_link_libraries(${PROJECT_NAME}
  PRIVATE
    dxcompiler::dxcompiler
    LLVMDxcSupport
    LLVMSupport
    spirv-cross-core
    spirv-cross-glsl
    spirv-cross-hlsl
    spirv-cross-msl
    spirv-cross-util
    SPIRV-Tools
)

sc_setup_compiler(${PROJECT_NAME})

# add_dependencies(${PROJECT_NAME}
#   spirv-cross-core
#   spirv-cross-glsl
#   spirv-cross-hlsl
#   spirv-cross-msl
#   SPIRV-Tools
#   # CopyDxcompiler
# )
