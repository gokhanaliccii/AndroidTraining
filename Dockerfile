FROM openjdk:8
ENV SDK_LINK https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip

RUN mkdir android_home && \
cd android_home && \ 
wget $SDK_LINK -O sdk.zip && \
unzip sdk.zip  && \
mkdir /root/.android && \
touch /root/.android/repositories.cfg 

RUN  cd android_home/tools && \ 
  cd bin && \
yes | ./sdkmanager --licenses && \
yes | ./sdkmanager "build-tools;28.0.3" "platforms;android-28" "platform-tools" 
