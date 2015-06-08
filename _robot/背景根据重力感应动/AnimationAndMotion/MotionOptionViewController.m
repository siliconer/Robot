//
//  MotionOptionViewController.m
//  AnimationAndMotion
//
//  Created by AnhDT on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MotionOptionViewController.h"

@implementation MotionOptionViewController
@synthesize delegate;
@synthesize slider;

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

- (IBAction)sliderChange:(UISlider *)sender
{
    scale = sender.value;
}

- (IBAction)save:(UIButton *)sender
{
    NSLog(@"Slider value : %d", scale);
    [self.delegate motionOption:self saveWithMotionScale:scale];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
