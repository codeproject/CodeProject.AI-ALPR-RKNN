# Installation script ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#
#                          ALPR-RKNN
#
# This script is called from the ALPR-RKNN directory using: 
#
#    bash ../../CodeProject.AI-Server/src/setup.sh
#
# The setup.sh file will find this install.sh file and execute it.

if [ "$1" != "install" ]; then
    read -t 3 -p "This script is only called from: bash ../../CodeProject.AI-Server/src/setup.sh"
    echo
    exit 1 
fi

moduleInstallErrors=""

if [ "${edgeDevice}" != "Orange Pi" ] && [ "${edgeDevice}" != "Radxa ROCK" ] ; then
    moduleInstallErrors="Unable to install on non-Orange Pi or Radxa ROCK hardware."
else
    # Download the OCR models and store in /paddleocr
    getFromServer "models/" "paddleocr-rknn-models.zip" "paddleocr" "Downloading Plate and OCR models..."

    # TODO: Check paddleocr created and has files, maybe run paddle check too
    # moduleInstallErrors=...
fi
