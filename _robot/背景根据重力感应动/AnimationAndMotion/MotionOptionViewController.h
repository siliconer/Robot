//
//  MotionOptionViewController.h
//  AnimationAndMotion
//
//  Created by AnhDT on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@class MotionOptionViewController;
@protocol MotionOptionViewControllerDelegate <NSObject>

- (void)motionOption:(MotionOptionViewController *)moitonOption saveWithMotionScale:(double)motionScale;

@end

@interface MotionOptionViewController : UIViewController
{
    IBOutlet UISlider *slider;
//    id<MotionOptionViewControllerDelegate> delegate;
    double scale;
}
@property (assign) IBOutlet UISlider *slider;
@property (assign) id<MotionOptionViewControllerDelegate> delegate;
- (IBAction)save:(UIButton *)sender;
- (IBAction)sliderChange:(UISlider *)sender;
@end
