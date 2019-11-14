cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_timer timer.cc
			timer_bucket.h
			timer_manager.cc
			timer_task.cc
			timing_slot.cc
			timing_wheel.cc)
target_link_libraries(cyber_timer cyber::data
                                  cyber::proto)
add_library(cyber::timer ALIAS cyber_timer)


## gtest
#add_executable(timer_test timer_test.cc)
#target_link_libraries(timer_test gtest gtest_main gmock cyber::cyber_core)


install(TARGETS cyber_timer
LIBRARY DESTINATION lib
ARCHIVE DESTINATION lib
RUNTIME DESTINATION bin
INCLUDES DESTINATION .
)
