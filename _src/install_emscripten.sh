# Get the emsdk repo
git clone https://github.com/emscripten-core/emsdk.git ~/.config/emsdk

# Enter that directory
cd ~/.config/emsdk

# Fetch the latest version of the emsdk (not needed the first time you clone)
git pull

# Download and install the latest SDK tools.
./emsdk install latest
# Download specific versions with:
#   ./emsdk install 1.38.45

# Make the "latest" SDK "active" for the current user. (writes .emscripten file)
./emsdk activate latest

# Activate PATH and other environment variables in the current terminal
source ./emsdk_env.sh
