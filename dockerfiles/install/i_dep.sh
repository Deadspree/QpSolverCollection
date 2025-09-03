#!/bin/bash
set -e

# Replace slow default mirrors with a faster one
sed -i 's|http://archive.ubuntu.com/ubuntu/|http://mirror.kakao.com/ubuntu/|g' /etc/apt/sources.list
sed -i 's|http://security.ubuntu.com/ubuntu/|http://mirror.kakao.com/ubuntu/|g' /etc/apt/sources.list

apt-get update && apt-get install -y \
    locales \
    apt-transport-https \
    ca-certificates \
    curl gnupg2 lsb-release \
    build-essential git \
    python3-pip


curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
    -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" \
    > /etc/apt/sources.list.d/ros2.list

apt-get update

apt-get install -y \
    ros-humble-ros-core \
    python3-colcon-common-extensions

apt-get clean
rm -rf /var/lib/apt/lists/*


echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc
