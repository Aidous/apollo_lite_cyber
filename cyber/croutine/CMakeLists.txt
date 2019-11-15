cmake_minimum_required(VERSION 3.5.1)

if($ENV{CPU} MATCHES "x86")
set(SWAP_SRCS detail/swap_x86_64.S)
elseif($ENV{CPU} MATCHES "k8")
set(SWAP_SRCS detail/swap_aarch64.S)
endif()

set(SWAP_SRCS detail/swap_x86_64.S)

add_library(cyber_swap ${SWAP_SRCS})
add_library(cyber::swap ALIAS cyber_swap)

add_library(cyber_croutine croutine.cc
			routine_factory.h
			detail/routine_context.cc)
set_target_properties(cyber_croutine PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_croutine cyber::swap
					  cyber::common
					  cyber::base
					  cyber::data
					  cyber::event
					  atomic)
add_library(cyber::croutine ALIAS cyber_croutine)

## gtest
add_executable(croutine_test croutine_test.cc)
target_link_libraries(croutine_test gtest gtest_main
					  gmock
					  cyber::cyber)


install(TARGETS cyber_croutine
		croutine_test
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib
        RUNTIME DESTINATION bin
        INCLUDES DESTINATION .
        )
