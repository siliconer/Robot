//
//  MCSDemoFishEyeItem.m
//  FishEyeDemo
//
//  Created by Bartosz Ciechanowski on 8/30/13.
//  Copyright (c) 2013 Macoscope. All rights reserved.
//

#import "MCSDemoFishEyeItem.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIGraphics.h>
#import <UIKit/UIImage.h>
@interface MCSDemoFishEyeItem()
@end

@implementation MCSDemoFishEyeItem

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    _backgroundView.layer.cornerRadius = 24.0f;
//    _label = [[UILabel alloc] initWithFrame:self.bounds];
//    _label.textAlignment = NSTextAlignmentCenter;
//    _label.font = [UIFont systemFontOfSize:40.0f];
//    _label.backgroundColor = [UIColor clearColor];
//    
//    UIGraphicsBeginImageContext(_backgroundView.frame.size);
//    [[UIImage imageNamed:@"1s.png"] drawInRect:_backgroundView.bounds];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    _backgroundView.backgroundColor = [UIColor colorWithPatternImage:image];
    
//    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"1s"]];
//    _backgroundView.backgroundColor = background;
    
    [self addSubview:_backgroundView];
//    [self addSubview:_label];
  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  _backgroundView.frame = CGRectInset(self.bounds, 5.0, 5.0);
  _backgroundView.backgroundColor = [self defaultColor];

//  _label.frame = CGRectInset(self.bounds, 5.0, 5.0);
  
}
//- (ListItemView *)itemView {
//  if (!_itemView) {
//    _itemView = [[ListItemView alloc] init];
//    _itemView.itemViewDataSource = self;
//    [_itemView.commentBtn addTarget:self action:@selector(itemViewCommentBtnPressed) forControlEvents:UIControlEventTouchUpInside];
//    [_itemView.seriesBtn addTarget:self action:@selector(itemViewSeriesBtnPressed) forControlEvents:UIControlEventTouchUpInside];
//  }
//  return _itemView;
//}
//
//-(UIColor*)ba
- (UIColor *)selectedColor
{
  return [UIColor colorWithRed:192.0f/255.0f green:41.0f/255.0f blue:66.0f/255.0f alpha:1.0];
}

- (UIColor *)highlightedColor
{
  return [UIColor colorWithRed:217.0f/255.0f green:91.0f/255.0f blue:67.0f/255.0f alpha:1.0];
}

- (UIColor *)defaultColor
{
  
  UIGraphicsBeginImageContext(_backgroundView.frame.size);
  [[UIImage imageNamed:self.imgname] drawInRect:_backgroundView.bounds];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  UIColor* backgroundColor = [UIColor colorWithPatternImage:image];
  [_backgroundView setBackgroundColor:backgroundColor];
  return backgroundColor;

//  return [UIColor colorWithRed:236.0f/255.0f green:208.0f/255.0f blue:120.0f/255.0f alpha:1.0];
//  return [UIColor whiteColor];
}
- (void)setInitColor:(NSInteger)itemIndex{
  [self colorImgManupuplate:itemIndex selected:NO];
  [self defaultColor];
  
}
- (void)colorImgManupuplate:(NSInteger)itemIndex selected:(NSInteger)selected{
  if(itemIndex==0) {
    if (selected == 2){
      if (self.imgname ==@"2s.png") self.imgname = @"1s.png";
      else self.imgname = @"2s.png";
    } else{
      self.imgname = @"1s.png";
    }
  } else if (itemIndex==1){
      if(selected == 2){
        if (self.imgname ==@"3s.png") self.imgname = @"4s.png";
        else self.imgname=@"3s.png";
      } else {
        self.imgname=@"4s.png";
      }
  } else if(itemIndex==2) {
      if(selected!=2){
        self.imgname=@"3s.png";
      } else {
        self.imgname=@"3s.png";
      }
  }else if(itemIndex==3) {
      if(selected!=2){
        self.imgname=@"4s.png";
      } else {
        self.imgname=@"4s.png";
      }
  }else if(itemIndex==4) {
      if(selected!=2){
        self.imgname=@"5s.png";
      } else {
        self.imgname=@"5s.png";
      }
  }else if(itemIndex==5) {
      if(selected!=2){
        self.imgname=@"6s.png";
      } else {
        self.imgname=@"6s.png";
      }
  }

}

- (UIColor*)deselectedColor
{
  UIGraphicsBeginImageContext(_backgroundView.frame.size);
  [[UIImage imageNamed:@"2s.png"] drawInRect:_backgroundView.bounds];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  UIColor* backgroundColor = [UIColor colorWithPatternImage:image];
  return backgroundColor;
  
}
-(void)setDeselected:(BOOL)animated {
  [super setDeselected:animated];
  self.backgroundView.backgroundColor=[self deselectedColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
//  
//  [UIView animateWithDuration:animated ? 0.2 : 0.0 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//    if (selected) {
////      self.backgroundView.backgroundColor = [self selectedColor];
//            self.backgroundView.backgroundColor = [self defaultColor];
////      self.label.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
////      self.label.textColor = [UIColor greenColor];
//    } else {
//      self.backgroundView.backgroundColor = [self defaultColor];
////      self.label.textColor = [UIColor colorWithWhite:0.2 alpha:0.7];
//    }
//  } completion:NULL];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
  [super setHighlighted:highlighted animated:animated];
//  
//  [UIView animateWithDuration:animated ? 0.2 : 0.0 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//    if (highlighted) {
////      self.backgroundView.backgroundColor = [self highlightedColor];
//        self.backgroundView.backgroundColor = [self defaultColor];
//
////      self.label.textColor = [UIColor colorWithWhite:1.0 alpha:1.0];
//    } else {
//      self.backgroundView.backgroundColor = [self defaultColor];
////      self.label.textColor = [UIColor colorWithWhite:0.2 alpha:0.7];
//    }
//  } completion:NULL];
  
}

@end
