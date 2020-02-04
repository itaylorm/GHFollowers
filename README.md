# GHFollowers
Proof of concept project for working with users and their followers on GitHub. This includes the ability to favorite certain users for following them and seeing their followers.This is a work in progress that demonstrated how to build a coded UI without a Storyboard.

##### Note: 
This is my version of the code from SAllen0400's course. See the Original Course titled "iOS Dev Job Interview Practice" which can be found here https://seanallen.teachable.com/courses

# Overview
## Login
A user enters the name of someone for whom they wish to look for followers
### Login Screen
![](https://github.com/itaylorm/GHFollowers/blob/master/Images/LoginXSMax.png)

## Followers
A user then sees the list of followers belonging to the entered username.
The user has the ability to favorite the current username using the plus button in the upper right corner
### Followers Screen
![](https://github.com/itaylorm/GHFollowers/blob/master/Images/FollowersXSMax.png)
## Favorites
User sees favorited users on the second tab
### Favorites Screen
![](https://github.com/itaylorm/GHFollowers/blob/master/Images/FavoritesXSMax.png)
## User Details
Selecting any follower results in the display of that user's details
### User Details Screen
![](https://github.com/itaylorm/GHFollowers/blob/master/Images/UserXSMax.png)

# How To Install
1. Open Terminal
2. Install CocoaPods - Sudo gem install cocoapods
3. Clone Project to your machine
4. Open terminal in the directory where you copied the project (The one that has the .xcodeproj in it)
5. Run 'Pod init' If you don't have Pods installed
6. Run 'Pod install' to copy down the different dependencies
7. Open project with the GHFollowers.xcworkspace NOT the GHFollowers.xcodeproj

# Swift Lint
The only third party project is SwiftLint for syntax checking. You can learn more about this tool at https://academy.realm.io/posts/slug-jp-simard-swiftlint/



