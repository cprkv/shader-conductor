# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

cmake_minimum_required(VERSION 3.9)
project(shader-conductor-project)

set(SC_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(SC_BUILD_DIR ${CMAKE_CURRENT_BINARY_DIR})

# if(PROJECT_IS_TOP_LEVEL)
# 	set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${SC_BUILD_DIR}/bin)
# 	set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${SC_BUILD_DIR}/bin)
# 	set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${SC_BUILD_DIR}/bin)
# endif()

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


add_subdirectory(deps)
add_subdirectory(shader-conductor)
add_subdirectory(shader-conductor-tests)
add_subdirectory(shader-conductor-cmd)

function(sc_set_target_output_variant target variant)
  if(variant STREQUAL "")
    set_target_properties(${target} PROPERTIES
      RUNTIME_OUTPUT_DIRECTORY E:/src/mine/vy-shader-conductor/build/bin
      LIBRARY_OUTPUT_DIRECTORY E:/src/mine/vy-shader-conductor/build/bin
      ARCHIVE_OUTPUT_DIRECTORY E:/src/mine/vy-shader-conductor/build/bin
    )
  else()
    set_target_properties(${target} PROPERTIES
      RUNTIME_OUTPUT_DIRECTORY_${variant} E:/src/mine/vy-shader-conductor/build/bin
      LIBRARY_OUTPUT_DIRECTORY_${variant} E:/src/mine/vy-shader-conductor/build/bin
      ARCHIVE_OUTPUT_DIRECTORY_${variant} E:/src/mine/vy-shader-conductor/build/bin
    )
  endif()
endfunction()

function(sc_set_target_output target)
  sc_set_target_output_variant(${target} "")
  sc_set_target_output_variant(${target} "DEBUG")
  sc_set_target_output_variant(${target} "RELEASE")
  sc_set_target_output_variant(${target} "RELWITHDEBINFO")
endfunction()

sc_set_target_output(dxcompiler)
sc_set_target_output(shader-conductor)
sc_set_target_output(shader-conductor-tests)
sc_set_target_output(shader-conductor-cmd)
