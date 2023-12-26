//
//  AppDelegate.m
//  goodMail
//
//  Created by Hansmander Singh on 2023-12-17.
//

#import "AppDelegate.h"
#import <GoogleSignIn/GoogleSignIn.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [GIDSignIn.sharedInstance restorePreviousSignInWithCompletion:^(GIDGoogleUser * _Nullable user,
                                                                      NSError * _Nullable error) {
        if (error) {
          // Show the app's signed-out state.
        } else {
          // Show the app's signed-in state.
        }
      }];
    return YES;
}

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
  BOOL handled;

  handled = [GIDSignIn.sharedInstance handleURL:url];
  if (handled) {
    return YES;
  }

  // Handle other custom URL types.

  // If not handled by this app, return NO.
  return NO;
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
