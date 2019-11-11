export CYBER_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
binary_path="${CYBER_PATH}/../apollo/lib"
cyber_tool_path="${CYBER_PATH}/../apollo/bin"
apollo_tool_path="${CYBER_PATH}/../apollo/bin"
recorder_path="${CYBER_PATH}/../apollo/bin"
monitor_path="${CYBER_PATH}/../apollo/bin"
visualizer_path="${CYBER_PATH}/../apollo/bin"
PYTHON_LD_PATH="${CYBER_PATH}/../apollo/lib"  # problem exist
launch_path="${CYBER_PATH}/tools/cyber_launch"
channel_path="${CYBER_PATH}/tools/cyber_channel"
node_path="${CYBER_PATH}/tools/cyber_node"
service_path="${CYBER_PATH}/tools/cyber_service"
qt_path=/opt/Qt5.5.1/5.5/gcc_64
rosbag_to_record_path="/apollo/bazel-bin/modules/data/tools/rosbag_to_record"

export LD_LIBRARY_PATH=${qt_path}/lib:${binary_path}:$LD_LIBRARY_PATH
export QT_QPA_PLATFORM_PLUGIN_PATH=${qt_path}/plugins
export PATH=${binary_path}:${recorder_path}:${monitor_path}:${launch_path}:${channel_path}:${node_path}:${service_path}:${qt_path}/bin:${visualizer_path}:${rosbag_to_record_path}:$PATH
export PYTHONPATH=${PYTHON_LD_PATH}:${CYBER_PATH}/python:$PYTHONPATH

export CYBER_DOMAIN_ID=80
export CYBER_IP=127.0.0.1
export CYBER_RUN_MODE=reality  # reality simulation

export GLOG_log_dir=${CYBER_PATH}/../log  # add for glog dir. # /apollo/data/log
export GLOG_alsologtostderr=1   # if print all meesage to terminal else 0.
export GLOG_colorlogtostderr=1
export GLOG_minloglevel=0

export cyber_trans_perf=0
export cyber_sched_perf=0

# for DEBUG log
#export GLOG_minloglevel=-1
#export GLOG_v=4

source ${CYBER_PATH}/tools/cyber_tools_auto_complete.bash
