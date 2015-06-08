//
//  CameraSliderVC.m
//  Robot
//
//  Created by xukang on 4/23/14.
//  Copyright (c) 2014 xukang. All rights reserved.
//

#import "CameraSliderVC.h"
//#import "CameraSlider.h"

@interface CameraSliderVC ()
- (void)updateValue:(id)slider;
@end

@implementation CameraSliderVC

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    CameraSlider* _mSlider = [[CameraSlider alloc] initialize];
    UISlider* _mSlider = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    _mSlider.minimumValue = 0;
	_mSlider.maximumValue = 1000;
	_mSlider.value = 0;
    _mSlider.transform = CGAffineTransformRotate(_mSlider.transform, 90.0/180*M_PI);
	[_mSlider addTarget:self action:@selector(updateValue:) forControlEvents:UIControlEventValueChanged];
    
    _popView = [[UILabel alloc]initWithFrame:CGRectMake(_mSlider.frame.origin.x, _mSlider.frame.origin.y-20, 70, 20)];
    [_popView setTextAlignment:UITextAlignmentCenter];
    [_popView setBackgroundColor:[UIColor clearColor]];
    
    [_popView setAlpha:0.f];
    [self.view addSubview:_mSlider];
//    [self.view addSubview:_popView];
    
	// Do any additional setup after loading the view.
}

- (void)updateValue:(id)slider{
    NSLog(@"update");
    UISlider* _mSlider = slider;
    UIImageView *imageView = [_mSlider.subviews objectAtIndex:2];
    
//    CGRect theRect = [self.view.window convertRect:imageView.frame fromView:imageView.superview];
    
//    [_popView setFrame:CGRectMake(theRect.origin.x-22, theRect.origin.y-30, _popView.frame.size.width, _popView.frame.size.height)];
    
    NSInteger v = _mSlider.value+0.5;
    NSLog(@"value %d",v);
//    [_popView setText:[NSString stringWithFormat:@"%d",v]];
    
//    [UIView animateWithDuration:0.5
//                     animations:^{
//                         [_popView setAlpha:1.f];
//                     }
//                     completion:^(BOOL finished){
//                         // 动画结束时的处理
//                     }];
//    
    [_timer invalidate];
    _timer = nil;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1
                                              target:self
                                            selector:@selector(disPopView)
                                            userInfo:nil repeats:NO];
}

- (void)disPopView{
    [UIView animateWithDuration:0.5
                     animations:^{
                         [_popView setAlpha:0.f];
                     }
                     completion:^(BOOL finished){
                         // 动画结束时的处理
                     }];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
