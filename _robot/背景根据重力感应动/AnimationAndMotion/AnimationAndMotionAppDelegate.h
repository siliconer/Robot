//
//  AnimationAndMotionAppDelegate.h
//  AnimationAndMotion
//
//  Created by AnhDT on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "MotionImageViewController.h"

@interface AnimationAndMotionAppDelegate : NSObject <UIApplicationDelegate>
{
    MotionImageViewController *mivc;
    CMMotionManager *motionManager;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MotionImageViewController *mivc;

@property (readonly) CMMotionManager *motionManager;

@end
