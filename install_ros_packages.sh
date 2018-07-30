#!/bin/sh

#install ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop -y


#install necessary ros librarys
sudo apt-get install ros-kinetic-effort-controllers -y
sudo apt-get install ros-kinetic-gmapping -y
sudo apt-get install ros-kinetic-navigation -y
sudo apt-get install ros-kinetic-global-planner -y
sudo apt-get install ros-kinetic-teb-local-planner -y

sudo rosdep init
rosdep update

#setup in bashrc were src are for the ros workspace
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential -y

#create the catkin workspace for the ros to be build in
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make

#setup were devel is in the catkin workspace
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

# download the HRP code from github and make the necessary changes to the code
cd ~/catkin_ws/src
git clone https://github.com/HusqvarnaResearch/hrp.git
cd hrp/am_driver_safe
touch CATKIN_IGNORE

# other needed packages and make the workspace
cd ~/catkin_ws/src
git clone https://github.com/husky/husky.git
cd ~/catkin_ws/src/husky
git checkout kinetic-devel

cd ~/catkin_ws/src
git clone https://github.com/ros-drivers/rosserial
git clone https://github.com/robopeak/rplidar_ros
cd ~/catkin_ws && rosdep install --from-paths src --ignore-src -r -y
cd ~/catkin_ws && catkin_make


sudo apt-get install python3-pip -y
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get install sublime-text-installer -y
sudo pip3 install --upgrade --pre CodeIntel

sudo apt-get install ros-kinetic-video-stream-opencv -y
### for running videos as rostopics
#test with: rosrun video_stream_opencv test_video_resource.py rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov












