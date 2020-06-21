//
//  ViewController.m
//  AnushkTestSDK
//
//  Created by Anushk Mittal on 1/19/17.
//  Copyright © 2017 Anushk Mittal. All rights reserved.
//

#import "UIViewController+Logging.h"
#import "UIApplication+swizzle.h"
#import <objc/runtime.h>
#import "AnushkTestSDK/AnushkTestSDK-Swift.h"

#define NSLog if([[AnushkTestSDKManager shared] DEBUGGING] == true)NSLog

@implementation UIViewController (Logging)



-(void)swizzled_viewDidAppear:(BOOL)animated
{
    //  [self.view addSubview:imagePickerController.view];
    
    /*UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(imageTouch:withEvent:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [button setImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
    [self.view addSubview:button];*/
    
    [self swizzled_viewDidAppear:animated];
}

- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event
{
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    UIControl *control = sender;
    control.center = point;
}

- (IBAction) imageTouch:(id) sender withEvent:(UIEvent *) event
{
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    UIControl *control = sender;
    control.center = point;
}

-(void)swizzled_sendEvent:(BOOL)animated
{
    NSLog(@"Swizzling send event");
}

bool touchedElement = false;
NSString *action = @"";

+(void) swizzleMethod:(Class)cls :(SEL)original with :(SEL)replacement {
    //NSLog(@"I'm so so happy for myself today :D");
    SEL originalSelector = original;
    SEL replacementSelector = replacement;
    
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method replacementMethod = class_getInstanceMethod(cls, replacementSelector);
    method_exchangeImplementations(originalMethod, replacementMethod);
}

- (BOOL)mq_sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event {
    //NSLog(@"I'm so so sohappy for myself today :D");
    if (!touchedElement) {
        NSLog(@"sendAction");
        //[Barista logEvent:NSStringFromSelector(action) sender:sender event:event];
    }
    return [self mq_sendAction:action to:target from:sender forEvent:event];
}

-(void)mq_sendEvent:(UIEvent *)event {
    NSDateFormatter *formatter;
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"mm:ssZZZZZ"];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    
    NSLog(@"%@",dateString);
    touchedElement = false;
    NSSet *touches = event.allTouches;
    
    switch (event.type) {
        case 0:
            action = @"touchesEnded";
        case 1:
            if (event.subtype == 1) {
                action = @"motionShake";
            } else {
                action = @"motion";
            }
            break;
        case 2:
            switch (event.subtype) {
                case 100:
                    action = @"RemoteControlPlay";
                    break;
                case 101:
                    action = @"RemoteControlPause";
                    break;
                case 102:
                    action = @"RemoteControlStop";
                    break;
                case 103:
                    action = @"RemoteControlTogglePlayPause";
                    break;
                case 104:
                    action = @"RemoteControlNextTrack";
                    break;
                case 105:
                    action = @"RemoteControlPreviousTrack";
                    break;
                case 106:
                    action = @"RemoteControlBeginSeekingBackward";
                    break;
                case 107:
                    action = @"RemoteControlEndSeekingBackward";
                    break;
                case 108:
                    action = @"RemoteControlBeginSeekingForward";
                    break;
                case 109:
                    action = @"RemoteControlEndSeekingForward";
                    break;
                default:
                    action = @"RemoteControl";
            }
        case 3:
            action = @"presses";
            break;
        case UIEventTypeScroll:
            action = @"UIEventTypeScroll";
            break;
        case UIEventTypeHover:
            action = @"UIEventTypeHover";
            break;
        case UIEventTypeTransform:
            action = @"UIEventTypeTransform";
            break;
    }
    
    for (UITouch *touch in touches) {
        if (touch.phase == 3) {
            NSLog(@"touchesEnded");
            for (UIView *view in touch.window.subviews) {
                CGPoint point = [touch locationInView:view];
                for (UIView *subview in view.subviews) {
                    if (CGRectContainsPoint(subview.frame, point)) {
                        touchedElement = true;
                        //[Barista logEvent:action sender:subview event:event];
                    }
                }
            }
        }
    }
    
    [self mq_sendEvent:event];
    NSLog(@"%@",dateString);
}


+ (void)load
{
    
    Method original, swizzled;
    
    original = class_getInstanceMethod(self, @selector(viewDidAppear:));
    swizzled = class_getInstanceMethod(self, @selector(swizzled_viewDidAppear:));
    
    method_exchangeImplementations(original, swizzled);

}



@end
