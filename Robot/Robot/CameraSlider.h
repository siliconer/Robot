//
//  CameraSlider.h
//  Robot
//
//  Created by xukang on 4/22/14.
//  Copyright (c) 2014 xukang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraSlider : UISlider
@property (nonatomic,strong)  NSTimer *timer;
@property (nonatomic)  UISlider* mSlider;
@property (nonatomic,strong)  UILabel *popView;
- (UISlider*)initialize;
@end
