//
//  CameraSlider.m
//  Robot
//
//  Created by xukang on 4/22/14.
//  Copyright (c) 2014 xukang. All rights reserved.
//

#import "CameraSlider.h"

@implementation CameraSlider

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

- (CameraSlider*)initialize {
  
    _mSlider = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    _mSlider.minimumValue = 0;
	_mSlider.maximumValue = 1000;
	_mSlider.value = 0;
    _mSlider.transform = CGAffineTransformRotate(_mSlider.transform, 90.0/180*M_PI);
    
//	[_mSlider addTarget:self action:@selector(updateValue:) forControlEvents:UIControlEventValueChanged];
    
//    _popView = [[UILabel alloc]initWithFrame:CGRectMake(_mSlider.frame.origin.x, _mSlider.frame.origin.y-20, 70, 20)];
//    [_popView setTextAlignment:UITextAlignmentCenter];
//    [_popView setBackgroundColor:[UIColor clearColor]];
//    
//    [_popView setAlpha:0.f];
//    [self addSubview:_mSlider];
//    [_mSlider addSubview:_popView];
    return _mSlider;
    

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
