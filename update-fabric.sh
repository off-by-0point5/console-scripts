serverjar="server18.jar"
mcversion=1.18

# Get version and url
echo "Get check for installer updates"
json=$(wget -nv -O - https://meta.fabricmc.net/v2/versions/installer)
version=$(echo $json | jq -r ".[0].version")
url=$(echo $json | jq -r ".[0].url")
installerjar="fabric-installer-$version.jar"
echo "Installer version is $version"

# Download installer jar if not present
[[ -f $installerjar ]] && echo "Current installer version present" || (echo "Download current installer version..." && wget -nv $url)

# Install fabric and download server if not present
[[ -f "server.jar" ]] && mv "server.jar" $serverjar # rename the server.jar to the name wanted
downloadmc="-downloadMinecraft"
[[ -f $serverjar ]] && downloadmc="" || echo "Server not present. Will be downloaded"
java -jar $installerjar server -mcversion $mcversion $downloadmc

# Create startup.sh
echo "tmux new -d -s minecraft java -server -Xms1G -Xmx2G -XX:ParallelGCThreads=2 -jar fabric-server-launch.jar nogui" > startup.sh
chmod u+x startup.sh

# Generate fabric-server-launcher.properties and rename downloaded server.jar to the specified name
echo "serverJar=$serverjar" > fabric-server-launcher.properties
[[ -f "server.jar" ]] && mv "server.jar" $serverjar
