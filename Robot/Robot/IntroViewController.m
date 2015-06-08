//
//  IntroViewController.m
//  Robot
//
//  Created by xukang on 4/15/14.
//  Copyright (c) 2014 xukang. All rights reserved.
//

#import "IntroViewController.h"
#import "IntroView.h"
#import "OPViewController.h"

@interface IntroViewController ()

@end

@implementation IntroViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


/// three way === > rootcontroller + loadview + cgrect draw ;  appdelegate .view = controll.view viewdidload ; xib rootviewcontroller viewdidload;

- (void)loadView
{
    self.view = [[IntroView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    self.view.backgroundColor = [UIColor blackColor];
// to modiffy to fit IPad &&* iphone
    CGRect playButtonframe = CGRectMake((320 - 100) * 0.2, 200, 100, 47);
    CGRect setButtonframe = CGRectMake((320 - 100) * 0.8, 200, 100, 47);
    [self createButtonWithTitle:@"play" frame:playButtonframe];
    [self createButtonWithTitle:@"setting" frame:setButtonframe];
//    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:YES];
//    
//    self.view.transform = CGAffineTransformMakeRotation(M_PI/2);
//    
//    self.view.bounds = CGRectMake(0.0, 0.0, 480, 320);
    



} 
- (UIButton *)createButtonWithTitle:(NSString *)string frame:(CGRect)frame 
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor blackColor];
    
    [button setTitle:string forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didTapButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
}

- (void)didTapButton{
    
    OPViewController *controller = [[OPViewController alloc] init];
//    NSLog(self.navigationController);
    [self.navigationController pushViewController:controller animated:YES];
}

//1. pushViewController: animated: - To Push the view on navigation stack
//2. presentModalViewController:nc animated: - To present the view modally.
//}
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    _playButton.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0f];
//    _playButton.titleLabel.textColor = [UIColor whiteColor];
//    [_playButton setTitle:@"text" forState:UIControlStateNormal];
//
////    categoryButton.frame = CGRectMake(0, 0, 0, 0);
//
//    [self.view addSubview:_playButton];
//    
////    [self.navigationController setTitle:@"text"];
//	// Do any additional setup after loading the view.
//}
- (NSUInteger)application:(UIApplication *)application
supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        NSLog(@"The Device is a iPad!");
    }else{
        NSLog(@"Not a iPad the device!");
    }
    return UIInterfaceOrientationMaskLandscape;
}
//http://zhenby.com/blog/2013/08/20/talk-ios-orientation/

- (void)didReceiveMemoryWarningk
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
