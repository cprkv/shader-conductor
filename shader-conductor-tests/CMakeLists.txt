# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

project(shader-conductor-tests)

set(SOURCE_FILES ShaderConductorTest.cpp)

set(DATA_INC_FILES
  Data/Input/Inc/HeaderA.hlsli
  Data/Input/Inc/HeaderB.hlsli
  Data/Input/Inc/HeaderEmpty.hlsli
)

set(DATA_FILES
  Data/Input/CalcLight.hlsl
  Data/Input/CalcLightDiffuse.hlsl
  Data/Input/CalcLightDiffuseSpecular.hlsl
  Data/Input/Common.hlsli
  Data/Input/Constant_PS.hlsl
  Data/Input/Constant_VS.hlsl
  Data/Input/DetailTessellation_HS.hlsl
  Data/Input/Fluid_CS.hlsl
  Data/Input/IncludeEmptyHeader.hlsl
  Data/Input/IncludeExist.hlsl
  Data/Input/IncludeNotExist.hlsl
  Data/Input/HalfDataType.hlsl
  Data/Input/Particle_GS.hlsl
  Data/Input/PassThrough_PS.hlsl
  Data/Input/PassThrough_VS.hlsl
  Data/Input/PNTriangles_DS.hlsl
  Data/Input/ToneMapping_PS.hlsl
  Data/Input/Transform_VS.hlsl
)

add_executable(${PROJECT_NAME} ${SOURCE_FILES} ${DATA_FILES} ${DATA_INC_FILES})
set_source_files_properties(${DATA_FILES} PROPERTIES VS_TOOL_OVERRIDE "None")
target_compile_definitions(${PROJECT_NAME} PRIVATE -DTEST_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/data/")
target_link_libraries(${PROJECT_NAME} PRIVATE shader-conductor gtest)
sc_setup_compiler(${PROJECT_NAME})

# source_group("Source Files" FILES ${SOURCE_FILES})
# source_group("Data Files\\Input" FILES ${DATA_FILES})
# source_group("Data Files\\Input\\Inc" FILES ${DATA_INC_FILES})
#add_dependencies(${PROJECT_NAME} shader-conductor gtest)
