//
//  OPViewController.h
//  Robot
//
//  Created by xukang on 4/15/14.
//  Copyright (c) 2014 xukang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSDPad.h"
#import "RobotService.h"

@interface OPViewController : UIViewController<JSDPadDelegate>
//JSDPad *_dPad;
@property (assign) id<JSDPadDelegate> delegate;
@property (nonatomic,strong) RobotService* robotService;

@end
