cmake_minimum_required(VERSION 3.5.1)

set(PROTOS examples.proto)

PROTOBUF_GENERATE_CPP(PROTO_SRCS PROTO_HDRS ${PROTOS})

include_directories(${PROTOBUF_INCLUDE_DIRS})

add_library(example_proto ${PROTO_SRCS} ${PROTO_HDRS})
target_link_libraries(example_proto ${PROTOBUF_LIBRARIES})

install(TARGETS example_proto
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION .
		)
