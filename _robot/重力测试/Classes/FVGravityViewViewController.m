//
//  FVGravityViewViewController.m
//  FVGravityView
//
//  Created by Fernando Valente on 3/21/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "FVGravityViewViewController.h"

@implementation FVGravityViewViewController

@synthesize labelx,labely,labelz,labeltext,labeltag,mytextview;
@synthesize distance,acelerometer;

-(void)getcounts:(CMMotionManager *)motionManager{
    CMAccelerometerData *newestAccel = motionManager.accelerometerData;
    double accelerationX = newestAccel.acceleration.x;
    double accelerationY = newestAccel.acceleration.y;
    double accelerationZ = newestAccel.acceleration.z;
    double gravityX = motionManager.deviceMotion.gravity.x;
    double gravityY = motionManager.deviceMotion.gravity.y;
    double gravityZ = motionManager.deviceMotion.gravity.z;
    double zTheta = atan2(gravityZ,sqrtf(gravityX*gravityX+gravityY*gravityY))/M_PI*180.0;
    double xyTheta = atan2(gravityX,gravityY)/M_PI*180.0;
    CMRotationRate rotationRate = motionManager.deviceMotion.rotationRate;
    double rotationX = rotationRate.x;
    double rotationY = rotationRate.y;
    double rotationZ = rotationRate.z;
    double roll    = motionManager.deviceMotion.attitude.roll;
    double pitch   = motionManager.deviceMotion.attitude.pitch;
    double yaw     = motionManager.deviceMotion.attitude.yaw;
    double w = motionManager.deviceMotion.attitude.quaternion.w;
    double wx = motionManager.deviceMotion.attitude.quaternion.x;
    double wy = motionManager.deviceMotion.attitude.quaternion.y;
    double wz = motionManager.deviceMotion.attitude.quaternion.z;
    
    NSMutableString * tempstr = [[NSMutableString alloc]init];
    [tempstr appendFormat:@"X轴加速度 = %0.2f\n",accelerationX];
    [tempstr appendFormat:@"Y轴加速度 = %0.2f\n",accelerationY];
    [tempstr appendFormat:@"Z轴加速度 = %0.2f\n",accelerationZ];
    [tempstr appendFormat:@"gravityX = %0.2f\n",gravityX];
    [tempstr appendFormat:@"gravityY = %0.2f\n",gravityY];
    [tempstr appendFormat:@"gravityZ = %0.2f\n",gravityZ];
    [tempstr appendFormat:@"Z轴倾斜角度 = %0.2f\n",zTheta];
    [tempstr appendFormat:@"屏幕旋转角度 = %0.2f\n",xyTheta];
    [tempstr appendFormat:@"X轴角速度 = %0.2f\n",rotationX];
    [tempstr appendFormat:@"Y轴角速度 = %0.2f\n",rotationY];
    [tempstr appendFormat:@"Z轴角速度 = %0.2f\n",rotationZ];
    [tempstr appendFormat:@"roll    = %0.2f\n",roll];
    [tempstr appendFormat:@"pitch   = %0.2f\n",pitch];
    [tempstr appendFormat:@"yaw     = %0.2f\n",yaw];
    [tempstr appendFormat:@"w = %0.2f\n",w];
    [tempstr appendFormat:@"wx = %0.2f\n",wx];
    [tempstr appendFormat:@"wy = %0.2f\n",wy];
    [tempstr appendFormat:@"wz = %0.2f\n",wz];
    mytextview.text = tempstr;
}

-(IBAction)onclick:(id)sender{
    CMMotionManager *motionManager = [[CMMotionManager alloc] init];
    if (!motionManager.accelerometerAvailable) {
        NSLog(@"没有加速计");
    }
    distance=0;
    motionManager.accelerometerUpdateInterval = 0.1; // 告诉manager，更新频率是100Hz
    [motionManager startDeviceMotionUpdates];
    [motionManager startAccelerometerUpdates];
    [motionManager startGyroUpdates];
    [motionManager startMagnetometerUpdates];
    
    CMAccelerometerData *newestAccel = motionManager.accelerometerData;
    double accelerationX = newestAccel.acceleration.x;
    double accelerationY = newestAccel.acceleration.y;
    double accelerationZ = newestAccel.acceleration.z;
    double gravityX = motionManager.deviceMotion.gravity.x;
    double gravityY = motionManager.deviceMotion.gravity.y;
    double gravityZ = motionManager.deviceMotion.gravity.z;
    double zTheta = atan2(gravityZ,sqrtf(gravityX*gravityX+gravityY*gravityY))/M_PI*180.0;
    double xyTheta = atan2(gravityX,gravityY)/M_PI*180.0;
    CMRotationRate rotationRate = motionManager.deviceMotion.rotationRate;
    double rotationX = rotationRate.x;
    double rotationY = rotationRate.y;
    double rotationZ = rotationRate.z;
    double roll    = motionManager.deviceMotion.attitude.roll;
    double pitch   = motionManager.deviceMotion.attitude.pitch;
    double yaw     = motionManager.deviceMotion.attitude.yaw;
    double w = motionManager.deviceMotion.attitude.quaternion.w;
    double wx = motionManager.deviceMotion.attitude.quaternion.x;
    double wy = motionManager.deviceMotion.attitude.quaternion.y;
    double wz = motionManager.deviceMotion.attitude.quaternion.z;
    
    NSMutableString * tempstr = [[NSMutableString alloc]init];
    [tempstr appendFormat:@"X轴加速度 = %0.2f\n",accelerationX];
    [tempstr appendFormat:@"Y轴加速度 = %0.2f\n",accelerationY];
    [tempstr appendFormat:@"Z轴加速度 = %0.2f\n",accelerationZ];
    [tempstr appendFormat:@"gravityX = %0.2f\n",gravityX];
    [tempstr appendFormat:@"gravityY = %0.2f\n",gravityY];
    [tempstr appendFormat:@"gravityZ = %0.2f\n",gravityZ];
    [tempstr appendFormat:@"Z轴倾斜角度 = %0.2f\n",zTheta];
    [tempstr appendFormat:@"屏幕旋转角度 = %0.2f\n",xyTheta];
    [tempstr appendFormat:@"X轴角速度 = %0.2f\n",rotationX];
    [tempstr appendFormat:@"Y轴角速度 = %0.2f\n",rotationY];
    [tempstr appendFormat:@"Z轴角速度 = %0.2f\n",rotationZ];
    [tempstr appendFormat:@"roll    = %0.2f\n",roll];
    [tempstr appendFormat:@"pitch   = %0.2f\n",pitch];
    [tempstr appendFormat:@"yaw     = %0.2f\n",yaw];
    [tempstr appendFormat:@"w = %0.2f\n",w];
    [tempstr appendFormat:@"wx = %0.2f\n",wx];
    [tempstr appendFormat:@"wy = %0.2f\n",wy];
    [tempstr appendFormat:@"wz = %0.2f\n",wz];
    mytextview.text = tempstr;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
	labeltag=YES;
    acelerometer = [[NSMutableArray alloc]init];

    CMMotionManager *motionManager = [[CMMotionManager alloc] init];
    if (!motionManager.accelerometerAvailable) {
        NSLog(@"没有加速计");
    }
    distance=0;    
    motionManager.accelerometerUpdateInterval = 0.02; // 告诉manager，更新频率是100Hz

    [motionManager startDeviceMotionUpdates];
//    [motionManager startAccelerometerUpdates];
//    [motionManager startGyroUpdates];
//    [motionManager startMagnetometerUpdates];

    [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *latestAcc, NSError *error)
     {
         acelerometer[0] = [NSString stringWithFormat:@"%0.2f",latestAcc.acceleration.x];
         acelerometer[1] = [NSString stringWithFormat:@"%0.2f",latestAcc.acceleration.y];
         acelerometer[2] = [NSString stringWithFormat:@"%0.2f",latestAcc.acceleration.z*-1];
         double gravityX = motionManager.deviceMotion.gravity.x;
         double gravityY = motionManager.deviceMotion.gravity.y;
         double gravityZ = motionManager.deviceMotion.gravity.z;
         double zTheta = fabs(atan2(gravityZ,sqrtf(gravityX*gravityX+gravityY*gravityY))/M_PI*180.0);
         CMRotationRate rotationRate = motionManager.deviceMotion.rotationRate;
         double rotationX = fabs(rotationRate.x);
         double rotationY = fabs(rotationRate.y);
         double rotationZ = fabs(rotationRate.z);
         
         NSString *newText=[[NSString alloc] initWithFormat:@"三轴: x: %@ y: %@ z: %@",acelerometer[0],acelerometer[1],acelerometer[2]];
         labelx.text=newText;
         
         if (latestAcc.acceleration.z*-1 >0.8 && zTheta <15 && rotationX <10   && labeltag) {
             labely.text = [NSString stringWithFormat:@"X轴角速度：%0.2f",rotationX];
             labelz.text = [NSString stringWithFormat:@"Z轴加速度：%0.2f",latestAcc.acceleration.z*-1];
             labeltext.text = [NSString stringWithFormat:@"Z轴斜度：%0.2f",zTheta];
             labeltag=NO;
             
             if ([acelerometer[2]floatValue]>1.6) {
                 [self playsound:@"hit00.wav"];
             }else if([acelerometer[2]floatValue]>1.3){
                 [self playsound:@"vocalf03.wav"];
             }else if([acelerometer[2]floatValue]>1.0){
                 [self playsound:@"ok.wav"];
             }else if([acelerometer[2]floatValue]>0.8){
                 [self playsound:@"W00FIR01.wav"];
             }
             
             NSMutableString * tempstr = [[NSMutableString alloc]init];
             [tempstr appendFormat:@"X轴加速度 = %@\n",acelerometer[0]];
             [tempstr appendFormat:@"Y轴加速度 = %@\n",acelerometer[1]];
             [tempstr appendFormat:@"Z轴加速度 = %@\n",acelerometer[2]];
             [tempstr appendFormat:@"Z轴倾斜角度 = %0.2f\n",zTheta];
             [tempstr appendFormat:@"x轴角速度 = %0.2f\n",rotationX];
             [tempstr appendFormat:@"y轴角速度 = %0.2f\n",rotationY];
             [tempstr appendFormat:@"z轴角速度 = %0.2f\n",rotationZ];
             mytextview.text = tempstr;
             
         }else if (latestAcc.acceleration.z*-1 <0) {
             //labeltext.text = @"";
             labeltag=YES;
         }else{
             //labeltag=YES;
         }

         //[self getcounts:motionManager];
         
     }];

}

-(void)playsound:(NSString *)soundname{
    NSString *tempstr1=[[NSString alloc]init];
    NSString *tempstr2=[[NSString alloc]init];
    NSRange subrange;
    subrange = [soundname rangeOfString:@".wav"];

    if (subrange.location !=NSNotFound) {
        tempstr1=[soundname substringToIndex:subrange.location];
        tempstr2=[soundname substringFromIndex:subrange.location+1];
    }else{
        NSLog(@"文件名输入错误！");
        return;
    }
    NSURL* system_sound_url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:tempstr1 ofType:tempstr2]];
    SystemSoundID system_sound_id;
    
    AudioServicesCreateSystemSoundID(
                                     (CFURLRef)system_sound_url,
                                     &system_sound_id
                                     );
    
    // Register the sound completion callback.
    AudioServicesAddSystemSoundCompletion(
                                          system_sound_id,
                                          NULL, // uses the main run loop
                                          NULL, // uses kCFRunLoopDefaultMode
                                          MySoundFinishedPlayingCallback, // the name of our custom callback function
                                          NULL // for user data, but we don't need to do that in this case, so we just pass NULL
                                          );
    
    // Play the System Sound
    AudioServicesPlaySystemSound(system_sound_id);
}


void MySoundFinishedPlayingCallback(SystemSoundID sound_id, void* user_data)
{
	AudioServicesDisposeSystemSoundID(sound_id);
}


-(void)viewDidUnload{
    CMMotionManager *motionManager = [[CMMotionManager alloc] init];
    [motionManager stopAccelerometerUpdates];
    [motionManager stopDeviceMotionUpdates];
    [motionManager stopGyroUpdates];
    [motionManager stopMagnetometerUpdates];
}
- (void)dealloc {
    [super dealloc];
}

@end
