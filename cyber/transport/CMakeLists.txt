cmake_minimum_required(VERSION 3.5.1)

add_library(cyber_transport transport.cc
			common/endpoint.cc
			common/identity.cc
			dispatcher/dispatcher.cc
			dispatcher/intra_dispatcher.cc
			dispatcher/rtps_dispatcher.cc
			dispatcher/shm_dispatcher.cc
			message/history.h
			message/history_attributes.h
			message/listener_handler.h
			message/message_info.cc
			qos/qos_profile_conf.cc
			receiver/hybrid_receiver.h
			receiver/intra_receiver.h
			receiver/receiver.h
			receiver/rtps_receiver.h
			receiver/shm_receiver.h
			rtps/attributes_filler.cc
			rtps/participant.cc
			rtps/sub_listener.cc
			rtps/underlay_message.cc
			rtps/underlay_message_type.cc
			shm/block.cc
			shm/condition_notifier.cc
			shm/multicast_notifier.cc
			shm/notifier_base.h
			shm/notifier_factory.cc
			shm/readable_info.cc
			shm/segment.cc
			shm/shm_conf.cc
			shm/state.cc
			transmitter/hybrid_transmitter.h
			transmitter/intra_transmitter.h
			transmitter/rtps_transmitter.h
			transmitter/shm_transmitter.h
			transmitter/transmitter.h)
set_target_properties(cyber_transport PROPERTIES LINKER_LANGUAGE CXX)
target_link_libraries(cyber_transport
					  cyber::task
					  ${FastRTPS_LIBRARIES}
					  ${FastCDR_LIBRARIES}
					  ${UUID_LIBRARY})
add_library(cyber::transport ALIAS cyber_transport)

### gtest
add_executable(transport_test transport_test.cc)
target_link_libraries(transport_test gtest gtest_main
					  gmock
					  cyber::cyber_core
					  cyber::proto)

add_executable(common_test common/common_test.cc)
target_link_libraries(common_test gtest gtest_main
					  gmock
					  cyber::cyber_core)

add_executable(dispatcher_test dispatcher/dispatcher_test.cc)
target_link_libraries(dispatcher_test gtest gtest_main gmock
					  cyber::cyber_core
					  cyber::proto)

add_executable(intra_dispatcher_test dispatcher/intra_dispatcher_test.cc)
target_link_libraries(intra_dispatcher_test gtest gtest_main gmock
					  cyber::cyber_core
					  cyber::proto)

add_executable(rtps_dispatcher_test dispatcher/rtps_dispatcher_test.cc)
target_link_libraries(rtps_dispatcher_test gtest gtest_main gmock
					  cyber::cyber_core
					  cyber::proto)

add_executable(shm_dispatcher_test dispatcher/shm_dispatcher_test.cc)
target_link_libraries(shm_dispatcher_test gtest gtest_main gmock
					  cyber::cyber_core
					  cyber::proto)

add_executable(message_test message/message_test.cc)
target_link_libraries(message_test gtest gtest_main gmock
					  cyber::cyber_core)

add_executable(rtps_test rtps/rtps_test.cc)
target_link_libraries(rtps_test gtest gtest_main gmock
					  cyber::cyber_core)

add_executable(hybrid_transceiver_test transceiver/hybrid_transceiver_test.cc)
target_link_libraries(hybrid_transceiver_test gtest gtest_main gmock
					  cyber::cyber_core
					  cyber::proto)

add_executable(intra_transceiver_test transceiver/intra_transceiver_test.cc)
target_link_libraries(intra_transceiver_test gtest gtest_main gmock
					  cyber::cyber_core
					  cyber::proto)

add_executable(rtps_transceiver_test transceiver/rtps_transceiver_test.cc)
target_link_libraries(rtps_transceiver_test gtest gtest_main gmock
					  cyber::cyber_core
					  cyber::proto)

add_executable(shm_transceiver_test transceiver/shm_transceiver_test.cc)
target_link_libraries(shm_transceiver_test gtest gtest_main gmock
					  cyber::cyber_core
					  cyber::proto)
install(TARGETS cyber_transport
		transport_test
		common_test
		dispatcher_test
		intra_dispatcher_test
		rtps_dispatcher_test
		shm_dispatcher_test
		message_test
		rtps_test
		hybrid_transceiver_test
		intra_transceiver_test
		rtps_transceiver_test
		shm_transceiver_test
		LIBRARY DESTINATION lib
		ARCHIVE DESTINATION lib
		RUNTIME DESTINATION bin
		INCLUDES DESTINATION .
		)
