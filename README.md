# NotifyMe

[![CI Status](http://img.shields.io/travis/Tony M Joseph/NotifyMe.svg?style=flat)](https://travis-ci.org/Tony M Joseph/NotifyMe)
[![Version](https://img.shields.io/cocoapods/v/NotifyMe.svg?style=flat)](http://cocoapods.org/pods/NotifyMe)
[![License](https://img.shields.io/cocoapods/l/NotifyMe.svg?style=flat)](http://cocoapods.org/pods/NotifyMe)
[![Platform](https://img.shields.io/cocoapods/p/NotifyMe.svg?style=flat)](http://cocoapods.org/pods/NotifyMe)

## Overview

NotifyMe is a subclass of UIButton, written in Swift 3. NotifyMe is customizable button that allows user to enter an email and send appropriate messages to the same.

<p align="center">
<img src="http://i.imgur.com/PNqtDQ7.gif" alt="NotifyMe" />
</p>


## Highlights

- [x] Color of button and textColor is customizable.
- [x] User can handle success and error condition.
- [x] Supports Swift and Objective-C.

## Installation

### CocoaPods:

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate `NotifyMe` into your Xcode project using CocoaPods, specify it in your Podfile:
```ruby

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
pod "NotifyMe"
end
```

Then, run the following command:

```bash
$ pod install
```

### Manually:

* Download NotifyMe.
* Drag and drop NotifyMe directory to your project


## Example Project

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* Xcode 7.3+
* iOS 8.0+

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Usage

Here is how you can use `NotifyMe`. 

Import NotifyMe to your viewcontroller,

```swift
import NotifyMe
```

* Drag and drop a button in the storyboard and set its constraints and attributes like background color and title color.
* Set the button class and module to NotifyMe.
<p align="center">
<img src="http://i.imgur.com/CvlxyQp.jpg" alt="NotifyMe" />
</p>
* Call the function fetchEmail as follows:

```swift

notifyMeButton.fetchEmail { (_) in
self.notifyMeButton.complete(result: .success) // if success
}
```

## Author

Tony M Joseph, tonyj@qburst.com

## License

NotifyMe is available under the MIT license. See the LICENSE file for more info.
