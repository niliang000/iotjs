# Copyright 2015-2016 Samsung Electronics Co., Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cmake_minimum_required(VERSION 2.8)

set(CC ${CMAKE_C_COMPILER})
set(CXX ${CMAKE_CXX_COMPILER})


# common compile flags
set(CFLAGS_COMMON "${CFLAGS_COMMON} -fpermissive")
set(CFLAGS_COMMON "${CFLAGS_COMMON} -fno-rtti")
set(CFLAGS_COMMON "${CFLAGS_COMMON} -s")
set(CFLAGS_COMMON "${CFLAGS_COMMON} -Wl,-Map=iotjstuv.map")
set(CFLAGS_COMMON "${CFLAGS_COMMON} -Werror")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DCONFIG_WCHAR_BUILTIN")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions")


set(IOTJS_CFLAGS "${IOTJS_CFLAGS} ${CFLAGS_COMMON}")
set(IOTJS_CFLAGS "${IOTJS_CFLAGS} ${CMAKE_CXX_FLAGS}")
set(IOTJS_LINK_FLAGS "${CMAKE_EXE_LINKER_FLAGS}")


string(TOLOWER ${CMAKE_SYSTEM_NAME} CFG_SYS_NAME_LOWER)
string(TOUPPER ${CMAKE_SYSTEM_NAME} CFG_SYS_NAME)
string(TOUPPER ${CMAKE_SYSTEM_PROCESSOR} CFG_SYS_PROCESSOR)


set(IOTJS_CFLAGS ${IOTJS_CFLAGS} ${CFLAGS_${CFG_SYS_NAME}})
set(IOTJS_CFLAGS ${IOTJS_CFLAGS} ${CFLAGS_${CFG_SYS_PROCESSOR}})


if(${CFG_SYS_NAME} STREQUAL "DARWIN")
  message(fatal "Darwin not ready")
endif()


if(${CFG_SYS_PROCESSOR} STREQUAL "ARM")
  set(PLATFORM_ARCH "arm")
elseif(${CFG_SYS_PROCESSOR} MATCHES "I686|X86|X86_64")
  set(PLATFORM_ARCH "x86")
else()
  message(fatal "Unsupported processor ${CFG_SYS_PROCESSOR}")
endif()


set(ROOT ${CMAKE_SOURCE_DIR})
set(SRC_ROOT ${ROOT}/src)
set(INC_ROOT ${ROOT}/include)
set(DEP_ROOT ${ROOT}/deps)
set(BIN_ROOT ${CMAKE_BINARY_DIR})
set(LIB_ROOT ${BIN_ROOT}/../lib)
