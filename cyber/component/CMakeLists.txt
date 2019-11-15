cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_component component.h
			timer_component.cc)
set_target_properties(cyber_component PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_component ${gflags_LIBRARIES}
					  cyber::blocker)
add_library(cyber::component ALIAS cyber_component)

## gtest
add_executable(timer_component_test timer_component_test.cc)
target_link_libraries(timer_component_test gtest gtest_main
					  gmock
					  cyber::cyber)

add_executable(component_test component_test.cc)
target_link_libraries(component_test cyber::cyber
        gtest
        gtest_main)

install(TARGETS cyber_component
		timer_component_test
		component_test
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION .)