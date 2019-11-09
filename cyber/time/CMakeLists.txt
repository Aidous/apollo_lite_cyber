cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_time duration.cc
			rate.cc
			time.cc)
target_link_libraries(cyber_time cyber::common)
add_library(cyber::time ALIAS cyber_time)

install(TARGETS cyber_time
LIBRARY DESTINATION lib
ARCHIVE DESTINATION lib
RUNTIME DESTINATION bin
INCLUDES DESTINATION .
)
