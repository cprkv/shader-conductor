# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

cmake_minimum_required(VERSION 3.9)
project(shader-conductor-project)

if(PROJECT_IS_TOP_LEVEL)
  set(SC_BIN_DIR "${CMAKE_CURRENT_BINARY_DIR}/bin")
endif()

set(SC_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(SC_BUILD_DIR ${CMAKE_CURRENT_BINARY_DIR})


function(sc_setup_compiler target)
  set_target_properties(${target} PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED ON
    CXX_EXTENSIONS OFF
    LINKER_LANGUAGE CXX
  )
  if(MSVC)
    target_compile_definitions(${PROJECT_NAME}
      PRIVATE
        -D_CRT_SECURE_NO_DEPRECATE
        -D_CRT_SECURE_NO_WARNINGS
        -D_SCL_SECURE_NO_DEPRECATE
        -D_SCL_SECURE_NO_WARNINGS
        -D_SILENCE_CXX17_ITERATOR_BASE_CLASS_DEPRECATION_WARNING
    )
  endif()
endfunction()

function(sc_set_target_output_variant target variant dir)
  if(variant STREQUAL "")
    set_target_properties(${target} PROPERTIES
      RUNTIME_OUTPUT_DIRECTORY ${dir}
      LIBRARY_OUTPUT_DIRECTORY ${dir}
      ARCHIVE_OUTPUT_DIRECTORY ${dir}
    )
  else()
    set_target_properties(${target} PROPERTIES
      RUNTIME_OUTPUT_DIRECTORY_${variant} ${dir}
      LIBRARY_OUTPUT_DIRECTORY_${variant} ${dir}
      ARCHIVE_OUTPUT_DIRECTORY_${variant} ${dir}
    )
  endif()
endfunction()

function(sc_set_target_output target dir)
  sc_set_target_output_variant(${target} "" ${dir})
  sc_set_target_output_variant(${target} "DEBUG" ${dir})
  sc_set_target_output_variant(${target} "RELEASE" ${dir})
  sc_set_target_output_variant(${target} "RELWITHDEBINFO" ${dir})
endfunction()


add_subdirectory(deps)
sc_set_target_output(dxcompiler ${SC_BIN_DIR})

add_subdirectory(shader-conductor)
sc_set_target_output(shader-conductor ${SC_BIN_DIR})

if(TARGET gtest)
  add_subdirectory(shader-conductor-tests)
  sc_set_target_output(shader-conductor-tests ${SC_BIN_DIR})
endif()

if(TARGET cxxopts)
  add_subdirectory(shader-conductor-cmd)
  sc_set_target_output(shader-conductor-cmd ${SC_BIN_DIR})
endif()
