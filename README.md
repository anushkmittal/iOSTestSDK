# AnushkTestSDK
for iOS 13.0 and above.

### Note: All Test Applications run right out of the box with the framework pre installed and configured.

# Usage:

Add the following code in the `didFinishLaunchingWithOptions` method of the App Delegate:

```
AnushkTestSDKManager.shared.login(
applicationID: "com.example.AppName",
allowScreenshots: true/false,
logAllTouches: true/false,
showButton: true/false,
enableConsoleLogging: true/false,
saveScreenshotsLocally: true/false)

```
- `applicationID`: Required by the server to unqiuely identify your app sessions <br>

- `allowScreenshots`: Enables capturing screenshots for every triggered action <br>

- `logAllTouches`: Allows logging multiple minute touches as received by `UIControl` instead of just one inferred gesture based touch. <br>

- `showButton`: Enables AnushkTestSDK float button to be displayed on the top of your app with extra functionality <br>

- `enableConsoleLogging`: Enables logging all captured events to your console <br>

- `saveScreenshotsLocally`: Allows to save the manually captured screenshot (through the float button) to your device locally. This requires you to add `NSPhotoLibraryAddUsageDescription` privacy key to your app target's `Info.plist`.

# Installation Instructions

## Install through CocoaPods:

Refer to this <a href="https://guides.cocoapods.org/using/using-cocoapods.html"> link </a> for more details. Navigate to your project directory and `pod init` on terminal. Clone this SDK to the same parent directory as your project's.

~~~~
# Uncomment this line to define a global platform for your project
platform :ios, '10.0'

# Replace Calculator with your app's target name
target 'Calculator' do
# Comment this line if you're not using Swift and don't want to use dynamic frameworks
use_frameworks!

# Pods for Calculator
pod 'AnushkTestSDK', :path => '../AnushkTestSDK'

end
~~~~

## Install through Carthage

Add the following to your Cartfile:

`github "anushkmittal/AnushkTestSDK" ~> 1.1`

## Create the workspace
Run `pod install` in the same directory you initialize the podfile. Close your project and open the newly created workspace file on Xcode.

## Create a bridging header (Swift Only)
Try adding any Objective-C file to your project. Name it whatever you want and click yes when prompted to create a bridging header. Add `#import <AnushkTestSDK/AnushkTestSDK.h>` to the file.

## Import In AppDelegate (Objective-C)
Add `#import <AnushkTestSDK/AnushkTestSDK.h>` to your project's AppDelegate

## (Optional) Build the pods framework target
Optionally build the pods framework target before building your app target.

<I> Voila! You've set up a AnushkTestSDK dependency to your target project. </I>

## Excluding AnushkTestSDK from release builds for App Store

1. Make sure to configure Cocoapods installation like this `pod 'AnushkTestSDK', :path => '../../AnushkTestSDK', :configurations => ['Debug']`

2. At the places in your code where you integrate AnushkTestSDK, do a `#if DEBUG` check to ensure the tool is only accessible in your Debug builds and to avoid errors in your Release builds.

3. You might need to specify the `DEBUG` flag in build settings like this: https://i.stack.imgur.com/GKizw.png
