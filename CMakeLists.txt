cmake_minimum_required(VERSION 3.20)
project(LedHat CXX C ASM)

set(CMAKE_CXX_STANDARD 17)
set(PICO_PLATFORM rp2040)
set(PICO_BOARD pico_w)

include($ENV{PICO_SDK_PATH}/pico_sdk_init.cmake)
pico_sdk_init()

add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} pico_stdlib)

pico_add_extra_outputs(${PROJECT_NAME})
