wget -O - https://raw.githubusercontent.com/off-by-0point5/console-scripts/main/alpine-setup.sh | sh
apk add openjdk11-jre-headless screen
echo "export TERM=vt100" >> .profile
source .profile
wget -O proxy.jar https://ci.velocitypowered.com/job/velocity-3.0.0/37/artifact/proxy/build/libs/velocity-proxy-3.0.0-all.jar
echo "screen -dmS proxy java -Xms215M -Xmx1750M -jar proxy.jar" >> start.sh
chmod u+x start.sh
