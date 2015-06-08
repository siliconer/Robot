//
//  MotionImageViewController.h
//  AnimationAndMotion
//
//  Created by AnhDT on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "MotionOptionViewController.h"

@interface MotionImageViewController : UIViewController <MotionOptionViewControllerDelegate>
{
    IBOutlet UIImageView *imageView;
    IBOutlet UILabel *accelerationX;
    IBOutlet UILabel *accelerationY;
    IBOutlet UILabel *accelerationZ;
}
@property (retain) IBOutlet UIImageView *imageView;
@property (readonly) CMMotionManager *motionManager;
@property (assign) double scale;

- (IBAction)driftingImage:(UIButton *)sender;
- (IBAction)showOptions:(UIButton *)sender;
@end
