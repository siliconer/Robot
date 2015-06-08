//
//  MotionImageViewController.m
//  AnimationAndMotion
//
//  Created by AnhDT on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MotionImageViewController.h"

@implementation MotionImageViewController
@synthesize imageView;
@synthesize scale;

- (CMMotionManager *)motionManager
{
    CMMotionManager *motionManager = nil;
    id appDelegate = [UIApplication sharedApplication].delegate;
    if([appDelegate respondsToSelector:@selector(motionManager)])
        motionManager = [appDelegate motionManager];
    return motionManager;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)motionOption:(MotionOptionViewController *)moitonOption saveWithMotionScale:(double)motionScale
{
    self.scale = motionScale;
    [self dismissModalViewControllerAnimated:YES];    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scale = 1.0;
    // Do any additional setup after loading the view from its nib.
//    UITapGestureRecognizer *tapgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
//    [self.view addGestureRecognizer:tapgr];
//    [tapgr release];
}

#define MOTION_SCALE 1.0
- (void)startDrifting:(UIImageView *)imgView
{
    [self.motionManager startAccelerometerUpdatesToQueue:[[[NSOperationQueue alloc] init] autorelease] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        dispatch_sync(dispatch_get_main_queue(), ^(void) {
            CGRect imgFrame = imgView.frame;
            imgFrame.origin.x += accelerometerData.acceleration.x * self.scale;
            if(!CGRectContainsRect(self.view.bounds, imgFrame))
                imgFrame.origin.x = imgView.frame.origin.x;
            imgFrame.origin.y -= accelerometerData.acceleration.y * self.scale;
            if(!CGRectContainsRect(self.view.bounds, imgFrame))
                imgFrame.origin.y = imgView.frame.origin.y;
            imgView.frame = imgFrame;
            
            accelerationX.text = [NSString stringWithFormat:@"accelerationX : %f", accelerometerData.acceleration.x];
            accelerationY.text = [NSString stringWithFormat:@"accelerationY : %f", accelerometerData.acceleration.y];
            accelerationZ.text = [NSString stringWithFormat:@"accelerationZ : %f", accelerometerData.acceleration.z];
        });
        
    }];
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    [self startDrifting:imageView];
//}
//
//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//    [self.motionManager stopAccelerometerUpdates];
//}

- (IBAction)driftingImage:(UIButton *)sender
{
    if ([self.motionManager isAccelerometerActive]) {
        [self.motionManager stopAccelerometerUpdates];
    } else {
        [self startDrifting:imageView];
    }
}
- (IBAction)showOptions:(UIButton *)sender
{
    MotionOptionViewController *movc = [[MotionOptionViewController alloc] init];
    movc.delegate = self;
    [self presentModalViewController:movc animated:YES];
    [movc release];
}

- (void)moveView:(UIImageView *)imgView toPoint:(CGPoint)destination
{
    UIViewAnimationOptions options = UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState;
    [UIView animateWithDuration:2.0 delay:0.0 options:options animations:^(void) {
        imgView.center = destination;
    } completion:nil];
    [UIView animateWithDuration:1.0 delay:0 options:options animations:^(void) {
        imgView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:0.0 options:options animations:^(void) {
            imgView.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
}

- (void)tap:(UIGestureRecognizer *)gesture
{
    [self moveView:self.imageView toPoint:[gesture locationInView:self.view]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.imageView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{
    [super dealloc];
    [imageView release];
}

@end
