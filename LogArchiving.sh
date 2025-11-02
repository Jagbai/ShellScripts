DIRECTORY=$1
echo "Archiving $1 directory"
mkdir -p ./archives
DATE=$(date "+%Y%m%d_%H%M%S")tar -czvf "$(pwd)/archives/logs_archive_$(date +"%Y%m%d_%H%M%S").tar.gz" -C $1 .
echo "Saved as logs_archive_$(date +"%Y%m%d_%H%M%S").tar.gz"