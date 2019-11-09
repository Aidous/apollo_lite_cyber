cmake_minimum_required(VERSION 3.5.1)

add_subdirectory(proto)

#add_library(cyber_example_test example_component.cc
#			hello-greet.cc)
#target_link_libraries(cyber_example_test cyber::class_loader
#					  cyber::component)

#add_executable(example_camera camera.cc)
#target_link_libraries(example_camera cyber::cyber
#					  example_proto)

add_executable(example_talker talker.cc)
target_link_libraries(example_talker cyber::cyber
					  example_proto)

add_executable(example_listener listener.cc)
target_link_libraries(example_listener cyber::cyber
					  example_proto)

#add_executable()