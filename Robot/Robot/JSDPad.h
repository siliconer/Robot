//
//  JSDPad.h
//  Robot
//
//  Created by xukang on 4/15/14.
//  Copyright (c) 2014 xukang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JSDPadDirection)
{
	JSDPadDirectionUpLeft = 1,
	JSDPadDirectionUp,
	JSDPadDirectionUpRight,
	JSDPadDirectionLeft,
	JSDPadDirectionNone,
	JSDPadDirectionRight,
	JSDPadDirectionDownLeft,
	JSDPadDirectionDown,
	JSDPadDirectionDownRight
};

@class JSDPad;

@protocol JSDPadDelegate <NSObject>

- (void)dPad:(JSDPad *)dPad didPressDirection:(JSDPadDirection)direction;
- (void)dPadDidReleaseDirection:(JSDPad *)dPad;

@end

@interface JSDPad : UIView

@property (nonatomic, weak) IBOutlet id <JSDPadDelegate> delegate;

- (JSDPadDirection)currentDirection;

@end
