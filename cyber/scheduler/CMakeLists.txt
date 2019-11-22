cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_scheduler SHARED processor.cc
			processor_context.cc
			scheduler.cc
			scheduler_factory.cc
			common/cv_wrapper.h
			common/mutex_wrapper.h
			policy/choreography_context.cc
			policy/classic_context.cc
			policy/scheduler_choreography.cc
			policy/scheduler_classic.cc)
set_target_properties(cyber_scheduler PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_scheduler cyber::croutine
					  cyber::event
					  cyber::data)
add_library(cyber::scheduler ALIAS cyber_scheduler)

## gtest
add_executable(scheduler_test scheduler_test.cc)
target_link_libraries(scheduler_test cyber::cyber
					  gtest gtest_main gmock)

add_executable(scheduler_classic_test scheduler_classic_test.cc)
target_link_libraries(scheduler_classic_test cyber::cyber
					  gtest gtest_main gmock)
#
add_executable(scheduler_choreo_test scheduler_choreo_test.cc)
target_link_libraries(scheduler_choreo_test cyber::cyber
					  gtest gtest_main gmock)


install(TARGETS cyber_scheduler
		scheduler_test
		scheduler_classic_test
		scheduler_choreo_test
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION .
		)
