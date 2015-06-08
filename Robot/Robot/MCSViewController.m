//
//  MCSViewController.m
//  FishEyeDemo
//
//  Created by Bartosz Ciechanowski on 8/30/13.
//  Copyright (c) 2013 Macoscope. All rights reserved.
//

#import "MCSViewController.h"
#import "MCSFishEyeView.h"
#import "MCSDemoFishEyeItem.h"
#import "TBViewController.h"
#import "CameraSlider.h"
#import "CameraSliderVC.h"
#import "LeveyPopListView.h"
#import "voicePlayVC.h"


@interface MCSViewController () <MCSFishEyeViewDataSource, MCSFishEyeViewDelegate>

@property (weak, nonatomic) IBOutlet MCSFishEyeView *leftFishEyeView;
@property (weak, nonatomic) IBOutlet MCSFishEyeView *topFishEyeView;
@property (weak, nonatomic) IBOutlet MCSFishEyeView *rightFishEyeView;
@property (weak, nonatomic) IBOutlet MCSFishEyeView *bottomFishEyeView;

@property (strong, nonatomic) IBOutletCollection(MCSFishEyeView) NSArray *fishEyeViews;

@end

@implementation MCSViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
//  self.leftFishEyeView=[[MCSFishEyeView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
 [self.leftFishEyeView setFrame:CGRectMake(0, 0, 60, 320)];
  self.leftFishEyeView.itemSize = CGSizeMake(80.0, 80.0);
  self.leftFishEyeView.contentInset = UIEdgeInsetsMake(10.0, 2.0, 10.0, 0.0);
  [self.leftFishEyeView registerItemClass:[MCSDemoFishEyeItem class]];
//
//  self.rightFishEyeView.itemSize = CGSizeMake(130.0, 130.0);
//  self.rightFishEyeView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 20.0, 10.0);
//  self.rightFishEyeView.expansionDirection = MCSFishEyeExpansionDirectionLeft;
////  self.rightFishEyeView.selectedItemOffset = 80.0f;
//  [self.rightFishEyeView registerItemNib:[UINib nibWithNibName:@"MCSDemoXibFishEyeViewItem" bundle:nil]];
//
//  self.topFishEyeView = [[MCSFishEyeView alloc]initWithFrame:CGRectMake(0, 0, 90, 90)];
//  [self.topFishEyeView commonInit];
//  self.topFishEyeView.itemSize = CGSizeMake(90.0, 90.0);
//  self.topFishEyeView.expansionDirection = MCSFishEyeExpansionDirectionBottom;
//  self.topFishEyeView.contentInset = UIEdgeInsetsMake(10.0, 0.0, 0.0, 0.0);
//  [self.topFishEyeView registerItemClass:[MCSDemoFishEyeItem class]];
//  
//  self.bottomFishEyeView.itemSize = CGSizeMake(90.0, 90.0);
//  self.bottomFishEyeView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
//  self.bottomFishEyeView.expansionDirection = MCSFishEyeExpansionDirectionTop;
//  self.bottomFishEyeView.selectedItemOffset = 50.0f;
//  [self.bottomFishEyeView registerItemClass:[MCSDemoFishEyeItem class]];
//  
  for (MCSFishEyeView *fishEye in self.fishEyeViews) {
    fishEye.dataSource = self;
    fishEye.delegate = self;
    [fishEye reloadData];
  }
    
}

#pragma mark - FishEye Data Source

- (NSUInteger)numberOfItemsInFishEyeView:(MCSFishEyeView *)fishEyeView
{
  return fishEyeView == self.rightFishEyeView ? 7 : 7;
}

- (void)fishEyeView:(MCSFishEyeView *)fishEyeView configureItem:(MCSDemoFishEyeItem *)item atIndex:(NSUInteger)index
{
  if (fishEyeView == self.leftFishEyeView) {
    item.label.text = [@(index + 1) stringValue];
  } else {
    item.label.text = [NSString stringWithFormat:@"%c", 'A' + index];
  }
}

#pragma mark - FishEye Delegate

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    while(hitview!=nil) {
//        if([hitview isKindOfClass:MCSDemoFishEyeItem.class]){
//            NSLog(@"iskindoff");
//        }
//        [hitview superview];
//    }
//    UITouch *touch=[touches anyObject];

    
  for (MCSFishEyeView *fishEye in self.fishEyeViews) {
//      BOOL _isPress ;
    [fishEye deselectSelectedItemAnimated:YES index:fishEye.selectedIndex];
//      CGPoint start=[touch locationInView:self.view];
//      if (CGRectContainsPoint(fishEye.frame, start)) {
//          _isPress=YES;
//      }
//      else
//      {
//          _isPress=NO;
//      }
  }
  NSLog(@"controller");
}


- (void)fishEyeView:(MCSFishEyeView *)fishEyeView gravityset:(NSInteger)gravitySetNo {
    //gravityNo =0 off ,1 on
    if(gravitySetNo==0)  
        NSLog(@"turn gravity off");
    else
        NSLog(@"turn gravity on");
}
- (void)fishEyeView:(MCSFishEyeView *)fishEyeView cameraRed:(NSInteger)cameraRedNo{
    //cameraRed =0 off,1 on
    if(cameraRedNo==0)
        NSLog(@"camera offf");
    else
        NSLog(@"camera on");
}
- (void)fishEyeView:(MCSFishEyeView *)fishEyeView speedControl:(NSInteger)speedControlNo{
    TBViewController* SpeedVC = [[TBViewController alloc] initWithNibName:@"TBViewController" bundle:nil];
//    SpeedVC.view.alpha=1;
    if (speedControlNo ==0) {
        [self addChildViewController:SpeedVC];
        [SpeedVC.view setFrame:CGRectMake(80, 80,320,320)];
        SpeedVC.view.alpha=1;
        [self.view addSubview:SpeedVC.view];
        NSLog(@"speedVC");
    } else {
        for(UIView* v in [self.view subviews]){
            if (![v isKindOfClass:[MCSFishEyeView class]]){
                [v removeFromSuperview];
            }
        }
//        [[[[[self.view subviews] objectAtIndex:1] subviews]objectAtIndex:0] removeFromSuperview];
        [SpeedVC.view removeFromSuperview];
        [SpeedVC removeFromParentViewController];
    
    }
    
    
}
- (void)fishEyeView:(MCSFishEyeView *)fishEyeView cameraGuiGan:(NSInteger)cameraGuiGanNo{
    CameraSliderVC* cameraVC = [[CameraSliderVC alloc] init];
    if(cameraGuiGanNo==0) {
        [self addChildViewController:cameraVC];
        [cameraVC.view setFrame:CGRectMake(50, 100, 250,200)];
        [self.view addSubview:cameraVC.view];
        NSLog(@"cameraSlier");
    
    } else {

        for(UIView* v in [self.view subviews]){
            if (![v isKindOfClass:[MCSFishEyeView class]]){
                [v removeFromSuperview];
            }
        }
//        BOOL is = [[[self.view subviews] objectAtIndex:1] isKindOfClass:[UISlider class]];
//        [[[[[self.view subviews] objectAtIndex:1] subviews]objectAtIndex:0] removeFromSuperview];
        [cameraVC.view removeFromSuperview];
        [cameraVC removeFromParentViewController];
    }
}
- (void)fishEyeView:(MCSFishEyeView *)fishEyeView voiceplay:(NSInteger)voiceplayNo{
    voicePlayVC* voiceVC = [[voicePlayVC alloc]init];
    
    if(voiceplayNo ==0) {
         [self addChildViewController:voiceVC];
         [voiceVC.view setFrame:CGRectMake(50, 100, 250, 200)];
         [self.view addSubview:voiceVC.view];
        NSLog(@"voiceplay");
    } else {
        for(UIView* v in [self.view subviews]){
            if (![v isKindOfClass:[MCSFishEyeView class]]){
                [v removeFromSuperview];
            }
        }
        [voiceVC.view removeFromSuperview];
        [voiceVC removeFromParentViewController];
        
    }
//    _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 30)];
//    _infoLabel.textAlignment = UITextAlignmentCenter;
//    _options = [NSArray arrayWithObjects:
//                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"1s.png"],@"img",@"Facebook",@"text", nil],
//                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"2s.png"],@"img",@"Twitter",@"text", nil],
//                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"3s.png"],@"img",@"Tumblr",@"text", nil],
//                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"4s.png"],@"img",@"Google+",@"text", nil],
//                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"5s.png"],@"img",@"LinkedIn",@"text", nil],
//                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"6s.png"],@"img",@"Pinterest",@"text", nil],
//                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"7s.png"],@"img",@"Dribbble",@"text", nil],
//                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"1s.png"],@"img",@"deviantArt",@"text", nil],
//                nil];
//    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"Share Photo to..." options:_options handler:^(NSInteger anIndex) {
//        _infoLabel.text = [NSString stringWithFormat:@"You have selected %@", _options[anIndex]];
//    }];
//    [lplv setFrame:CGRectMake(50, 100, 250, 200)];
//    //    lplv.delegate = self;
//    [lplv showInView:self.view animated:YES];
//
}
- (void)fishEyeView:(MCSFishEyeView *)fishEyeView autoSetting:(NSInteger)autoSettingNo{
    
}
@end
