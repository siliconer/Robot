//
//  MCSDemoFishEyeItem.h
//  FishEyeDemo
//
//  Created by Bartosz Ciechanowski on 8/30/13.
//  Copyright (c) 2013 Macoscope. All rights reserved.
//

#import "MCSFishEyeViewItem.h"

@interface MCSDemoFishEyeItem : MCSFishEyeViewItem

@property (nonatomic, strong, readonly) UIView *backgroundView;
@property (nonatomic, strong, readonly) UILabel *label;
@property (nonatomic, strong, readonly) UIColor *backgroundColor;
@property (nonatomic, strong) NSString* imgname;
@end
