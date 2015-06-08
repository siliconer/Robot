//
//  FVGravityViewViewController.h
//  FVGravityView
//
//  Created by Fernando Valente on 3/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <CoreMotion/CoreMotion.h>

@interface FVGravityViewViewController : UIViewController {

}
@property(nonatomic,retain)IBOutlet UILabel *labelx;
@property(nonatomic,retain)IBOutlet UILabel *labely;
@property(nonatomic,retain)IBOutlet UILabel *labelz;
@property(nonatomic,retain)IBOutlet UILabel *labeltext;
@property(nonatomic,retain)IBOutlet UITextView *mytextview;
@property(nonatomic)BOOL labeltag;
@property(nonatomic)float distance;
@property(nonatomic,retain)NSMutableArray * acelerometer;


-(IBAction)onclick:(id)sender;
@end

