//
//  MCSAppDelegate.m
//  FishEyeDemo
//
//  Created by Bartosz Ciechanowski on 8/29/13.
//  Copyright (c) 2013 Macoscope. All rights reserved.
//

#import "MCSAppDelegate.h"
#import "MCSViewController.h"

@implementation MCSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
  MCSViewController *viewController = [[MCSViewController alloc] init];
  [self.window setRootViewController:viewController];
  [self.window makeKeyAndVisible];
  
  return YES;
}
- (NSUInteger)application:(UIApplication *)application
supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
  if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
    NSLog(@"The Device is a iPad!");
  }else{
    NSLog(@"Not a iPad the device!");
  }
  return UIInterfaceOrientationMaskLandscape;
}
//    UINavigationController *ctl = [[UINavigationController alloc] initWithRootViewController:self.introViewController];


@end
