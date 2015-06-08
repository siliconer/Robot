ios
CGAffineTransformMakeScale
CGAffineTransformScale
   float scaleFactor = 0.5;
    self.bubble.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
    [self.bubble setNeedsDisplay];

    [UIView animateWithDuration:2.0 animations:^{
        self.frame = _rectToMoveTo;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0f animations:^{
            self.bubble.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    }];




    [UIView animateWithDuration:3.0 
                      delay:0.0 
                    options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse 
                 animations:^{
                      self.imageView.center = CGPointMake(self.imageView.center.x + 10,  
                                                          self.imageView.center.y);
                 } 
                 completion:NULL];
   animat the center




frame == superview
bounds == 0.0
contentoffset  . now view origin vs scrollview origion offset
contentInset 为contentView的四个边于srollview四个边的距离
两者之间没有关系，contentInset决定了contentview滑动到尽头时距离srollview的四个边距，contentOffset决定了contentview在srollview中的位置

contentSize是scrollview可以滚动的区域，比如frame = (0 ,0 ,320 ,480) contentSize = (320 ,960)，代表你的scrollview可以上下滚动，滚动区域为frame大小的两倍。 
contentOffset是scrollview当前显示区域顶点相对于frame顶点的偏移量，比如上个例子你拉到最下面，contentoffset就是(0 ,480)，也就是y偏移了480 
contentInset是scrollview的contentview的顶点相对于scrollview的位置，例如你的contentInset = (0 ,100)，那么你的contentview就是从scrollview的(0 ,100)开始显示 





 Expandedheight 120.000000
2014-04-19 16:20:31.940 FishEyeDemo[9994:c07] Expandedheight 120.000000
2014-04-19 16:20:31.944 FishEyeDemo[9994:c07] bounds 0.000000,14.000000,149.000000,40.000000
2014-04-19 16:20:31.944 FishEyeDemo[9994:c07] Expandedheight 70.000000
2014-04-19 16:20:31.945 FishEyeDemo[9994:c07] Expandedheight 70.000000

2014-04-19 16:20:31.946 FishEyeDemo[9994:c07] bounds 40.000000,0.000000,240.000000,95.000000
2014-04-19 16:20:31.946 FishEyeDemo[9994:c07] Expandedheight 90.000000
2014-04-19 16:20:31.946 FishEyeDemo[9994:c07] Expandedheight 90.000000

2014-04-19 16:20:31.947 FishEyeDemo[9994:c07] bounds 0.000000,20.000000,101.000000,260.000000
2014-04-19 16:20:31.948 FishEyeDemo[9994:c07] Expandedheight 130.000000
2014-04-19 16:20:31.948 FishEyeDemo[9994:c07] Expandedheight 130.000000

2014-04-19 16:20:31.949 FishEyeDemo[9994:c07] bounds 5.000000,20.000000,55.000000,310.000000
2014-04-19 16:20:31.949 FishEyeDemo[9994:c07] Expandedheight 120.000000
2014-04-19 16:20:31.950 FishEyeDemo[9994:c07] Expandedheight 120.000000



- (void)drawRect:(CGRect)rect 

{

CGContextRef context = UIGraphicsGetCurrentContext();

CGRect currentBounds = self.bounds;

CGGradientRef backgroundGradient;

size_t num_locations = 2;

CGFloat locations[2] = { 0.0, 1.0 };

CGFloat components[8] = { 0.0, 0.0, 0.0, 0.0,  0.0, 0.0, 0.0, 0.6}; // End color

CGColorSpaceRef rgbColorspace = CGColorSpaceCreateDeviceRGB();

backgroundGradient = CGGradientCreateWithColorComponents (rgbColorspace, components, locations, num_locations);

CGPoint centerPoint = CGPointMake(CGRectGetMidX(currentBounds), CGRectGetMidY(currentBounds));

CGContextDrawRadialGradient (context, backgroundGradient, centerPoint, 0.0, centerPoint, currentBounds.size.width, kCGGradientDrawsAfterEndLocation);

CGGradientRelease(backgroundGradient);

}

在UIView子类的drawRect中实现即可




http://www.cocoachina.com/bbs/simple/?t72975.html 隐藏信号



wifi :
http://code4app.com/ios/MMReachabilityViewController/51d5366b6803faa819000000  

http://www.cnblogs.com/mrhgw/archive/2012/08/01/2617760.html




http://kqwd.blog.163.com/blog/static/4122344820117191351263/ 真机调试.
http://jingyan.baidu.com/article/1709ad80af62f84634c4f0bb.html
http://aminby.net/4-1-to-4-6-wihout-idp-device-debug-all/



 iPhone5的 view 为568，减去Nav（44）+任务栏（20），为504，相比iPhone4s及以前版本的480，减去Nav+任务栏，为416，高出88（差别），
 iPhone5的屏点大小是320×568pts


①点

iPhone4s及其之前的屏点大小都是320×480 pts

iPhone5的屏点大小是320×568pts

②像素

iPhone4之前的普屏，像素（分辨率）都是320×480pixels。

iPhone4和iPhone4s使用的Retina屏，像素都是640×960 pixels

iPhone5的Retina屏，像素是1136×640pixels
http://blog.csdn.net/wzzvictory/article/details/8565872



tab bar 
https://github.com/Marxon13/M13InfiniteTabBar
https://github.com/ggould75/LSTabs




AudioServicesPlaySystemSound(kSystemSoundID_validate)




