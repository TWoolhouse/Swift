# Swift Guide

Guide to Installing Swfit on a Windows Machine with VSCode intergration.
This package includes both a installation script as well as intergration with vscode to run swift scripts from the editor.

Thanks to
[AtoZ Programming Tutorials](https://www.youtube.com/watch?v=rKN60MoqGn8) in which the installation is based off.

# Installation Guide

## Requirements

Programs and Content that needs to be downloaded and where to find it :)

1. [Swift Toolchain](https://swift.org/download/#releases)

    Download the `Windows 10` Installer.exe found under releases.

1. [Visual Studio Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2019)

    Download `Build Tools for Visual Studio 2019`. If you already have Visual Studio Community IDE Installed then it only needs to be modified, skip this download.

1. [Visual Studio Code](https://code.visualstudio.com/download)

    Download the `Windows System Installer 64 bit`.

1. [TWoolhouse/Swift Repo](https://github.com/TWoolhouse/Swift/)

    Download the contents of this repository from github. The green `Code` button and download the ZIP. (This is the same page you are currently reading, just scroll to the top.)

## Instructions

1. Install the [`Swift Toolchain`](https://swift.org/download/#releases). Windows will try protect your PC, yeah we don't care just run that anyway. Keep clicking yes til it's done should be cool (does take approx 3.2 years though).

1. Install [`Visual Studio Build Tools`](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2019) Please follow substeps based on if you have already installed Visual Studio. (It's like a choose your own adventure, without the fun... or adventure).
    * Visual Studio Installed
        1. Run the installer and accept some terms and conditions, sign away your sould what have you.

    * Visual Studio **NOT** Installed
        1. Open the windows start menu and search for `Visual Studio Installer` and run it.
        1. Once loaded click on modify next to your installation.

    * Everbody Now :)

    1. A selection screen of different modules and jazz should appear, we want to select `Desktop development with C++`.
    1. At the top, move to `Individual components`
    1. Search for and select `Windows Universal C Runtime`
    1. Install that bad boy (and let it run for the next 6 years).
    1. Now thats done just close it once its done its thing and we should be good to go.

1. Open the [`Repo`](https://github.com/TWoolhouse/Swift/) ZIP and extract it to the directory you want to develop all of your swift code in. So make it a good one! No seriously, you'll regret it later just dumping it in documents... Trust me. I have mine in `C:\dev\Swift\SWIFT_CODE_HERE` so I would empty the contents of `Swift-master.zip\Swift-master\` inside the `Swift\` directory. (From here on if I reference `C:\dev\Swift\` just change it to whatever you are using).

1. Right click `C:\dev\Swift\core\open.bat` and `Run as administrator`. If windows tells you it's unsafe to run. Trust me bro. People on the internet never lie :)
    1. Wait for the script to pop up and it'll say `Press any key to continue . . .` so do that.
    1. Wait a few moments again until a prompt for you to type appears. Enter `install.bat` and let that run finish.
    1. It'll prompt you to type `exit` ... Yeah do that.
    1. Now you can close the terminal window and we should be good-ish.

1. Install [`Visual Studio Code`](https://visualstudio.microsoft.com/) Again just sign your soul to the devil and all nothing new.

    1. During the setup you'll want to make sure during the `Additional Tasks` section, you select `Add to PATH` and personally I'd recommend the `Open with Code`. That last one will add the option to open any file with `vscode` when you right click it in Windows File Explorer. Up to you buddy.
    1. Coolio, now if it didn't automatically, open `vscode` as this is your new friend, say hello, be nice, you'll hate them soon. I recommend looking up how to navigate your way around this program or just follow the in-built welcome guide. But I'll guide you through how to finish installing this for now :)

1. You want to `Open Folder...` and open the `C:\dev\Swift\` folder into vscode.

    1. VSCode is heavily dependant on keyboard shortcuts, all of which you can change, but the **MOST** important one is `Ctrl+Shift+P` opens the `Command Pallete`. This has a list of *everything* vscode can do so you will use it a lot to navigate (but we shouldn't need it for this).
    1. In the explorer, open `test.swift` into the editor. It's just a bit of swift code so you can test I haven't messed anything up :)
    1. On the far left, click the weird triangle with a bug on it (Yeah idk either) or press `Ctrl+Shift+D` (see what I mean). Now with the test.swift file open in the editor (you can see the code) press the green run button next to `Swift Run` in the top left.
    1. If all has gone well, some stuff will build at the bottom, and you'll end up with the program outputting jazz at the bottom in the terminal.
        * You can also run the program by click the dropdown `Run` right at the very very top of the screen and hitting start without debugging.
        * Also, you can simply press `Ctrl+F5` to do the same thing.

1. You can now, hopefully run swift scripts from vscode :)))))) Have fun changing the colours n stuff and hating using swift on Windows! Thanks Apple, I hate you.

## Notes

Fun things to note while using this terrible thing I've hashed togeather in a day or two.

* Building
    * Swift is a compiled language so you can build the code without running it by pressing `Ctrl+Shift+B`.
    * This will update the problems panel (see below) and also produce an .exe file in the `\bin` directory. So if you make a nice program and want to use it a lot, you can run that exe directly. It'll be nammed the same as the swift file. You're not dumb you'll work it out.

* Problems Panel
    * I added support for once the code has been built/compiled, if there are any errors, vscode can hightlight them, and show them in the `Problems` panel at the bottom. (If you can't see it just try running a swift script, it'll appear).

* Cleaning Up
    * I recommend just deleting and emptying out the `\build` folder if you think my terrible programming has broken.
    * To be a lil more technical, it stores a cache of the most recently compiled file, so deleting the entire folder might help if my program has messed up. Clearing this cache forces swift to recompile your code and create a new binary.
    * Also it might save you a few KB every once in a while :)

* Namespace Collisions
    * Im bad at programming lol

## How it Works

If you don't care, stop reading. Seriously, I don't blame you. It's just boring :)

### Swift Toolchain and VS Build Tools

Sooo swift is built on-top of C, C++ effectively so we need the VS Build Tools to provide the C compiler on windows to produce the binary (.exe).

The Swift Toolchain kinda converts the swift code into C which then internally, they use the MSVC Compiler. Simples right. Okay I'm lying to you, it uses LLVM but idc enough.

### That weird open.bat and install.bat

Once swift and msvc are installed swift needs to just move a few files around. However, not only are they in a dumb folder requiring admin to access, they also require enviromental variables (not the planet kind) only provided by the devloper console.

So open.bat launches an instance of the devloper console.
Then install.bat does the moving and stuff, neat right.

### The quirky run.bat file.

Now this is the *magic*. Yeah I'm cool thanks for asking.

So when you start the build (configured in `.vscode\tasks.json`), it bascially just executes `core\run.bat`. If you are really interested you can read through the code but here's the overview.

1. Check if the file we are trying to compile is a .swift and exit if it's not.
1. Look at the cache, see if it matches the file we are currently compiling, if so, do we have an .exe for this file already. When both of these conditions are true it exits the script early without an error so vscode will run it.
1. So now we actually have to build the code.
1. Set up the enviroment by loading the developer console to get the enviroment variables.
1. Create a variable full of swift flags using that env.
1. Make the `build\` directory if it doesn't exist.
1. Run the main swift compiler with all the settings and set the build directory as our output.
1. Move the .exe to the newly created `bin\` directory
1. If any error occured during compilation, say we failed to build, else copy the source .swift file to the cache.
1. Done :)

The `.vscode\launch.json` will finally launch the new .exe file in the same working directory as the source .swift file.
This is output to the console by vscode.
