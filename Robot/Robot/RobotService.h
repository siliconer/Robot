//
//  RobotService.h
//  Robot
//
//  Created by xukang on 4/16/14.
//  Copyright (c) 2014 xukang. All rights reserved.
//


#import <Foundation/Foundation.h>

@class AFHTTPRequestOperationManager;

@interface RobotService : NSObject

@property(nonatomic, strong) AFHTTPRequestOperationManager *requestOperationManager;

- (id)initWithIPAddress:(NSString *)ipAddress;

- (void)queuePostParameters:(NSDictionary *)postParameters;
@end