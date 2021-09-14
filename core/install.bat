@echo off
echo Set up env for compiling swift

echo Following https://www.youtube.com/watch?v=rKN60MoqGn8
echo Install from swift.org
echo VS2019 C++ Devlopment Env + Windows Universal C runtime

copy %SDKROOT%\usr\share\ucrt.modulemap "%UniversalCRTSdkDir%\Include\%UCRTVersion%\ucrt\module.modulemap"
copy %SDKROOT%\usr\share\visualc.modulemap "%VCToolsInstallDir%\include\module.modulemap"
copy %SDKROOT%\usr\share\visualc.apinotes "%VCToolsInstallDir%\include\visualc.apinotes"
copy %SDKROOT%\usr\share\winsdk.modulemap "%UniversalCRTSdkDir%\Include\%UCRTVersion%\um\module.modulemap"

echo Please enter: "exit"
