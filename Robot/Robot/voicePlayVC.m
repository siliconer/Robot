//
//  voicePlayVC.m
//  Robot
//
//  Created by xukang on 4/23/14.
//  Copyright (c) 2014 xukang. All rights reserved.
//

#import "voicePlayVC.h"
#import "LeveyPopListView.h"
#import "LeveyPopListViewCell.h"
@interface voicePlayVC ()
@property (strong, nonatomic) NSArray *options;
@property (strong, nonatomic) UILabel *infoLabel;

@end

@implementation voicePlayVC
@synthesize options = _options;
@synthesize infoLabel = _infoLabel;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    _infoLabel.textAlignment = UITextAlignmentCenter;
    _options = [NSArray arrayWithObjects:
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"1s.png"],@"img",@"song1",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"2s.png"],@"img",@"song2",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"3s.png"],@"img",@"song3",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"4s.png"],@"img",@"song4+",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"5s.png"],@"img",@"song5",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"6s.png"],@"img",@"song6",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"7s.png"],@"img",@"song7",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"1s.png"],@"img",@"song8",@"text", nil],
                nil];
    LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:@"Share Photo to..." options:_options handler:^(NSInteger anIndex) {
        _infoLabel.text = [NSString stringWithFormat:@"You have selected %@", _options[anIndex]];
    }];
    [lplv setFrame:CGRectMake(0, 0, 200, 200)];
    lplv.delegate = self;
    [lplv showInView:self.view animated:YES];

}
#pragma mark - LeveyPopListView delegates
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    _infoLabel.text = [NSString stringWithFormat:@"You have selected %@",_options[anIndex]];
    NSLog(@"shit");
}
- (void)leveyPopListViewDidCancel {
    _infoLabel.text = @"You have cancelled";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
