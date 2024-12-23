# Check if a command exists
command_exists() {
  type "$1" &> /dev/null;
}


TEMP_DIR=/tmp
SOURCE_SUBDIR=oneagent
mkdir -p $TEMP_DIR/$SOURCE_SUBDIR
if [ $? -ne 0 ]; then
	echo "Failed to create $TEMP_DIR/$SOURCE_SUBDIR"
	exit -1
fi
