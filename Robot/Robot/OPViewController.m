//
//  OPViewController.m
//  Robot
//
//  Created by xukang on 4/15/14.
//  Copyright (c) 2014 xukang. All rights reserved.
//

#import "OPViewController.h"
#import "OPView.h"
#import "JSDPad.h"
#import "AFNetworking/AFHTTPRequestOperation.h"
#import "AFNetworking/AFHTTPRequestOperationManager.h"
#import "CircleMenuViewController.h"
#import "KYCircleMenu.h"
#import "Constants.h"
#import "MCSViewController.h"

#import "M13InfiniteTabBarController.h"
typedef NS_ENUM(NSInteger,SpeedButtonTag)
{
    SpeedButtonTagFast,
    SpeedButtonTagSlow
};

@interface OPViewController ()
- (NSString *)stringForDirection:(JSDPadDirection)direction;
- (void)queueGCode:(NSString *)gCode isStartCode:(BOOL)isStartCode;
- (void)queueGCode:(NSString *)gCode;
- (void)moveByDirection:(NSString*)move_direction;

@end

@implementation OPViewController
@synthesize robotService = _robotService;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    self.view = [[OPView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view setBackgroundColor:[UIColor whiteColor]];
 
    [self.navigationItem.backBarButtonItem setTitle:@""];
    [self.navigationItem  setHidesBackButton:YES];
    self.navigationController.toolbarHidden = YES;
    self.navigationController.navigationBarHidden = YES;
//    
    MCSViewController* MCSVC =[[MCSViewController alloc] init];

    [self addChildViewController:MCSVC];
//
    [self.view addSubview:MCSVC.view];//
//    M13InfiniteTabBarController* M13VC = [[M13InfiniteTabBarController alloc]init];
//    [self.view addSubview:M13VC.view];
//    [self addChildViewController:M13VC];
    
    CGRect dpadFrame = CGRectMake(280, 50, 150, 150);
    JSDPad* _dpad =[[JSDPad alloc] initWithFrame:dpadFrame];
    [_dpad setDelegate:self];
    [self.view addSubview:_dpad];
//    [self.view bringSubviewToFront:MCSVC.view];

    
    
//    @autoreleasepool {
    
//    CGRect fastButtonFrame = CGRectMake(250, 100, 50, 50);
//    CGRect slowButtonFrame = CGRectMake(250, 160, 50, 50);
//    UIButton* fastButton = [self createButtonWithTitle:@"fast" frame:fastButtonFrame tag:SpeedButtonTagFast];
//    UIButton* slowButton = [self createButtonWithTitle:@"slow" frame:slowButtonFrame tag:SpeedButtonTagSlow];
//    [self.view addSubview:fastButton];
//    [self.view addSubview:slowButton];
//
//    KYCircleMenu* KYCricleMenuVC = [KYCircleMenu alloc];
//    [KYCricleMenuVC initWithButtonCount:kKYCCircleMenuButtonsCount menuSize:kKYCircleMenuSize
//                                       buttonSize:kKYCircleMenuButtonSize
//                            buttonImageNameFormat:kKYICircleMenuButtonImageNameFormat
//                                 centerButtonSize:kKYCircleMenuCenterButtonSize
//                            centerButtonImageName:kKYICircleMenuCenterButton
//                  centerButtonBackgroundImageName:kKYICircleMenuCenterButtonBackground];
//    [self.view addSubview:KYCricleMenuVC.view];
//    [self addChildViewController:KYCricleMenuVC];
//  [self.view bringSubviewToFront:KYCricleMenuVC.view];
//  [circleMenuViewController.view setFrame:CGRectMake(90, 90, 20, 20)];
//    }
}


- (UIButton *)createButtonWithTitle:(NSString *)string frame:(CGRect)frame tag:(SpeedButtonTag)tag
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor blackColor];
    button.tag = tag;
    [button setTitle:string forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
    return button;
}
-(void)_toggle{
    NSLog(@"fuck");
}
-(void)didTapButton:(id)sender{
    SpeedButtonTag speedTag = (SpeedButtonTag)[sender tag];
    NSString* gcode = @"1";
    switch(speedTag) {
        case SpeedButtonTagFast:
            NSLog(@"fast");
            break;
        case SpeedButtonTagSlow:
            NSLog(@"slow");
            break;
    }
    [self queueGCode:gcode];

}
//init robotservice
- (RobotService *)robotService
{
    if(! _robotService)
    {
        _robotService = [[RobotService alloc] initWithIPAddress:@"10.1.3.2"];
    }
    return _robotService;
}




/// Pad Op

- (NSString *)stringForDirection:(JSDPadDirection)direction
{
	NSString *string = nil;
	
	switch (direction) {
		case JSDPadDirectionNone:
			string = @"None";
			break;
		case JSDPadDirectionUp:
			string = @"Up";
			break;
		case JSDPadDirectionDown:
			string = @"Down";
			break;
		case JSDPadDirectionLeft:
			string = @"Left";
			break;
		case JSDPadDirectionRight:
			string = @"Right";
			break;
		case JSDPadDirectionUpLeft:
			string = @"Up Left";
			break;
		case JSDPadDirectionUpRight:
			string = @"Up Right";
			break;
		case JSDPadDirectionDownLeft:
			string = @"Down Left";
			break;
		case JSDPadDirectionDownRight:
			string = @"Down Right";
			break;
		default:
			string = @"None";
			break;
	}
	
	return string;
}

-(void)moveByDirection:(NSString*)move_direction
{
    NSString*  gcode = @"1";
    if ([move_direction isEqualToString:@"left"]) {
        gcode = @"left";
    } else if([move_direction isEqualToString:@"Right"]){
        gcode = @"right";
    } else if([move_direction isEqualToString:@"forward"]){
        gcode = @"forward";
    } else if([move_direction isEqualToString:@"back"]) {
        gcode = @"back";
    }
    [self queueGCode:gcode];

}

- (void)queueGCode:(NSString *)gCode
{
    [self queueGCode:gCode isStartCode:NO];
}


- (void)queueGCode:(NSString *)gCode isStartCode:(BOOL)isStartCode
{
    if (!gCode) return;
    
    NSDictionary *parameters = @{
    @"start" : @"true",
    @"first" : isStartCode ? @"true" : @"false",
    @"gcode" : gCode
    };
    
    [self.robotService queuePostParameters:parameters];
}


#pragma mark - JSDPadDelegate
//办事的地方 真正 == 被调用
- (void)dPad:(JSDPad *)dPad didPressDirection:(JSDPadDirection)direction
{
	NSLog(@"Changing direction to: %@", [self stringForDirection:direction]);
    NSString *move_direction = [self stringForDirection:direction];
    [self  moveByDirection:move_direction];
}

- (void)dPadDidReleaseDirection:(JSDPad *)dPad
{
	NSLog(@"Releasing DPad");
}

//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//
//    // Uncomment the following line to preserve selection between presentations.
//    // self.clearsSelectionOnViewWillAppear = NO;
// 
//    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}
//
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

//#pragma mark - Table view delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    /*
//     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
//     */
//}

@end
