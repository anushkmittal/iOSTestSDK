//
//  UIApplication+swizzle.m
//  AnushkTestSDK
//
//  Created by Anushk Mittal on 1/30/17.
//  Copyright © 2017 Anushk Mittal. All rights reserved.

#import "UIApplication+swizzle.h"
#import "AnushkTestSDK/AnushkTestSDK-Swift.h"
#import <objc/runtime.h>
#import "SUPGridWindow.h"
#import <objc/message.h>

@implementation UIApplication (swizzle)
NSInteger logPossibleClicks = 0;
NSString *temp = @"";
UIView *tempSuperview = nil;
UIView *tempSubview = nil;
UIView *tempMask = nil;
UIWindow *tempWindow = nil;

/// Attributes to send to server
NSString *isUIControl = @"false";
NSString *stateUIControl = @"";
NSString *isEnabled = @"";
NSString *isSelected = @"";
NSString *isHighlighted = @"";
NSString *bounds = @"";
NSString *constrains = @"";
NSString *tags = @"";
NSString *accessibilityLabel = @"";
NSString *accessibilityFrame = @"";
NSString *allClicksLogged = @"false";
NSString *eventType = @"";
NSString *viewDetails = @"";
NSString *superView = @"";
NSString *superViewBound = @"";
NSString *superViewConstrain = @"";
NSString *superViewTag = @"";
NSString *receiverSubview = @"";
NSString *receiverWindow = @"";
NSString *maskView = @"";
NSString *uiTouchPhase = @"";
NSString *tapCount = @"";
NSString *maxPossForce = @"";
NSString *timeStamp = @"";
NSString *typeOfTouch = @"";
NSMutableArray *gestureRecognizers;
AnushkTestSDKLogger *logger;
AnushkTestSDK *manager;

#define NSLog if([[AnushkTestSDKManager shared] DEBUGGING] == true)NSLog

+(void) load
{
    logger = [[AnushkTestSDKManager shared] getNewLogger];
    manager = [AnushkTestSDKManager shared];
    //Swap the implementations of our interceptor and the original sendEvent:
    
    Method oldMethod1 = class_getInstanceMethod(self, @selector(sendAction:to:from:forEvent:));
    Method newMethod1 = class_getInstanceMethod(self, @selector(my_sendAction:to:from:forEvent:));
    method_exchangeImplementations(oldMethod1, newMethod1);
    
    Method oldMethod = class_getInstanceMethod(self, @selector(sendEvent:));
    Method newMethod = class_getInstanceMethod(self, @selector(interceptAndSendEvent:));
    method_exchangeImplementations(oldMethod, newMethod);
}


- (void) log_controls: (UIControl*) tempControl {
    
    if ([tempControl isKindOfClass:[FloatyItem class]] || ([tempControl isKindOfClass:[UIView class]] && [tempControl.accessibilityLabel isEqualToString: @"ANUSHKTESTSDK_FLOAT"]) || (![[AnushkTestSDKManager shared] isAssertValid] && [[AnushkTestSDKManager shared] dont_log_mode])) {
        // it's the AnushkTestSDK button don't do anything
        // goes back to perform original implementation
        logger.isFloatButton = true;
        return; //[self my_sendAction:action to:target from:sender forEvent:event];
    } else {
        logger.isFloatButton = false;
    }
    
    if ([tempControl isKindOfClass:[UIControl class]]) {
        NSLog(@"It's a UIControl");
        isUIControl = @"true";
    }
    
    logger.isUIControl = isUIControl;

    if (class_getProperty([tempControl class], "state")) {
        if (tempControl.state == UIControlStateNormal) {
            
            NSLog(@"The normal, or default state of a control—that is, enabled but neither selected nor highlighted.");
            stateUIControl = @"UIControlStateNormal";
            
        } else if (tempControl.state == UIControlStateHighlighted) {
            
            NSLog(@"Highlighted state of a control.");
            stateUIControl = @"UIControlStateHighlighted";
            
        } else if (tempControl.state == UIControlStateDisabled) {
            
            NSLog(@" Disabled state of a control.");
            stateUIControl = @"UIControlStateDisabled";
            
        } else if (tempControl.state == UIControlStateSelected) {
            
            NSLog(@" Selected state of a control.");
            stateUIControl = @"UIControlStateSelected";
            
        } else if (@available(iOS 9.0, *)) {
            if (tempControl.state == UIControlStateFocused) {
                
                NSLog(@" Focused state of a control.");
                stateUIControl = @"UIControlStateFocused";
                
            } else if (tempControl.state == UIControlStateApplication) {
                
                NSLog(@"Additional control-state flags available for application use");
                stateUIControl = @"UIControlStateApplication";
                
            } else if (tempControl.state == UIControlStateReserved) {
                
                NSLog(@"Control-state flags reserved for internal framework use.");
                stateUIControl = @"UIControlStateReserved";
            }
        } else {
            // Fallback on earlier versions
        }
        logger.stateUIControl = stateUIControl;
    }

    if (class_getProperty([tempControl class], "isEnabled")) {

        if (tempControl.isEnabled) {
            isEnabled = @"true";
        } else {
            isEnabled = @"false";
        }
        
        NSLog(@"isEnabled: %@", tempControl.isEnabled ? @"YES" : @"NO");
        logger.isEnabled = isEnabled;
    }


    if (class_getProperty([tempControl class], "isSelected")) {

        if (tempControl.isSelected) {
            isSelected = @"true";
        } else {
            isSelected = @"false";
            
        }
        
        NSLog(@"isSelected: %@", tempControl.isSelected ? @"YES" : @"NO");
        logger.isSelected = isSelected;
        
    }
    
    if (class_getProperty([tempControl class], "isHighlighted")) {

        if (tempControl.isHighlighted) {
            isSelected = @"true";
        } else {
            isSelected = @"false";
        }
        
        NSLog(@"isHighlighted: %@", tempControl.isHighlighted ? @"YES" : @"NO");
        logger.isHighlighted = isHighlighted;
    }

    //NSLog(@"allControlEvents: %@", tempControl.allControlEvents);
    
    if (class_getProperty([tempControl class], "bounds")) {
        NSLog(@"bounds: %@", NSStringFromCGRect(tempControl.bounds));
        bounds = NSStringFromCGRect(tempControl.bounds);
        logger.bounds = bounds;
    }

    if (class_getProperty([tempControl class], "constraints")) {
        NSLog(@"constraints: %@", tempControl.constraints.description);
        constrains = tempControl.constraints.description;
        logger.constrains = constrains;
    }

    if (class_getProperty([tempControl class], "tag")) {
        NSLog(@"tags: %ld", (long)tempControl.tag);
        tags = [NSString stringWithFormat:@"%ld", (long)tempControl.tag];
        logger.tags = tags;
    }

    if (class_getProperty([tempControl class], "accessibilityLabel")) {
        NSLog(@"accessibilityLabel: %@", tempControl.accessibilityLabel);
        if ([tempControl isKindOfClass:[UIButton class]]) {
            accessibilityLabel = [(UIButton *)tempControl titleForState:UIControlStateNormal];
        } else {
            accessibilityLabel = tempControl.accessibilityLabel;
        }
        logger.accessibilityLabell = accessibilityLabel;
    }

    
    if (class_getProperty([tempControl class], "accessibilityFrame")) {
        NSLog(@"accessibilityFrame: %@", NSStringFromCGRect(tempControl.accessibilityFrame));
        accessibilityFrame = NSStringFromCGRect(tempControl.accessibilityFrame);
        logger.accessibilityFramee = accessibilityFrame;
    }
    // finally queue the server request
    logger.timesincestartup_on_end = [[NSProcessInfo processInfo] systemUptime];
    [logger callUploadRequest];
    
}

UIControl *lastControl = nil;
NSInteger firstTime = 1;

/**Using this function to capture this control's all properties i.e. object, view, and specific*/
- (BOOL)my_sendAction:(SEL)action to:(id)target from:(id)sender forEvent:(UIEvent *)event {
    
    [self log_controls:sender];
    
    // create new logger
    logger = [[AnushkTestSDKManager shared] getNewLogger];

    return [self my_sendAction:action to:target from:sender forEvent:event];
}

UIView *lastview = nil;
//_Bool go_forward = FALSE;
-(void) interceptAndSendEvent: (UIEvent *) event {
    
    UIView *tempview = nil;
    
    assert(event.allTouches.count == 1);
    
    for (UITouch *touch in event.allTouches) {
        
        if (touch.view == NULL) {
            // cancel log. abort.
            logger.isFloatButton = true;
            //[[AnushkTestSDKManager shared] removeLastLogger];
            [self interceptAndSendEvent:event];
            // move forward
            return;
        } else if ([touch.view isKindOfClass:[FloatyItem class]] || ([touch.view.accessibilityLabel isEqualToString: @"ANUSHKTESTSDK_FLOAT"]) || (![[AnushkTestSDKManager shared] isAssertValid] && [[AnushkTestSDKManager shared] dont_log_mode])) {
            // cancel log. abort.
            logger.isFloatButton = true;
            //[[AnushkTestSDKManager shared] removeLastLogger];
            [self interceptAndSendEvent:event];
            // move forward
        } else if ([touch.view isKindOfClass:[UILabel class]]) { // the UIView itself is of type interest
            // UILabel found
            tempview = touch.view;
            logger.isFloatButton = false;
            break;
        } else if ([touch.view isKindOfClass:[UIControl class]]) {
            // UIControl found
            tempview = touch.view;
            logger.isFloatButton = false;
            [self log_controls: (UIControl*) tempview]; // log UI Control
            break;
        }else { // or it has multiple subviews. one of them might have item of interest
            for(UIView *aView in touch.view.subviews) {
                if([aView isKindOfClass:[UILabel class]] || [aView isKindOfClass:[UIControl class]]) { // UILabel or UIControl (objects of interest) touched!!
                    if (CGRectContainsPoint([aView frame], [touch locationInView:(touch.view)])) { // what if there are multiple UILabels. find THE one
                        // found the correct label
                        // draw a green border around the selected UIControl
                        tempview = aView;
                        logger.isFloatButton = false;
                        break;
                    }
                }
            }
            logger.isFloatButton = false;
        }
    }
    
    // so when assert, we do not want the action to take place which is handled (a) in the above UIControl intercept
    // to get an assert state of a new view:
    // a) -> ignore the touch log here, they are useless ✅
    // b) -> capture the details of the view ✅ + type check if view of type control., then fill the logor with UIControl state ✅
    // c) -> also type check if view contains subviews, and specifically add UILabel properties explicitly ✅
    // NOTE: c) should fix our tappinng calculator results problem too ✅
    // NOTE: since we are bypassing the above method completely, make sure that the green bar is produced here on tap #1 and then menu triggered on tap #2 (on the whole UIView) ✅
    // NOTE: since assert check happens here, and assert check on last action is simply logistical on logger, => the above method never has to deal with assert cheeck logic. we never call it, so it never has to filter
    
    if ([[AnushkTestSDKManager shared] isAssertValid] && !logger.isFloatButton) { // && go_forward
        // we are in assert mode
        
        for (UITouch *touch in event.allTouches) {
            if (touch.phase != UITouchPhaseEnded) {
                //[[AnushkTestSDKManager shared] removeLastLogger];
                return;
            }
        }
        
        // log all details about the view
        NSLog(@"Event: %@: %@", @"touched...", tempview);
        viewDetails = tempview.description;
        logger.viewDetails = viewDetails;
        
        tempSuperview = tempview.superview;
        NSLog(@"Superview: %@", tempview.superview);
        superView = tempview.superview.description;
        logger.superView = superView;

        
        NSLog(@"bounds: %@", NSStringFromCGRect(tempview.superview.bounds));
        superViewBound = NSStringFromCGRect(tempview.superview.bounds);
        logger.superViewBound = superViewBound;

        NSLog(@"constraints: %@", tempview.superview.constraints);
        superViewConstrain = tempview.superview.constraints.description;
        logger.superViewConstrain = superViewConstrain;
        
        NSLog(@"tags: %ld", (long)tempview.superview.tag);
        superViewTag = [NSString stringWithFormat:@"%ld", (long)tempview.superview.tag];
        logger.superViewTag = superViewTag;
        
        tempSubview = tempview.subviews.firstObject;
        NSLog(@"Subview: %@", tempview.subviews);
        receiverSubview = tempview.subviews.description;
        logger.receiverSubview = receiverSubview;

        NSLog(@"Receiver Window: %@", tempview.window);
        receiverWindow = tempview.window.description;
        logger.receiverWindow = receiverWindow;

        
        NSLog(@"Optional mask view: %@", tempview.maskView);
        maskView = tempview.maskView.description;
        logger.maskView = maskView;
        
        logger.uiTouchPhase = @"";
        logger.tapCount = @"";
        logger.maxPossForce = @"";
        logger.timeStamp = @"";
        logger.typeOfTouch = @"";
        logger.gestureRecognizers = @"";
        
        logger.isAnAssertionLog = true;
        
        
        // draw a green border around the selected view of interest
        tempview.layer.borderColor = [UIColor greenColor].CGColor;
        tempview.layer.borderWidth = 3.0;
        
        // call the add assertion check dialog if necessary
        
        // SHOW ADD ASSERTION CHECK IF:
        // 1) WE ARE IN CHECK ASSERTION MODE
        // 2) WE HAVE DOUBLE CLICKED ON THE SAME ELEMENT
        if (lastview != nil && lastview == tempview) {
            
            // don't show the grid no more
            if ([[SUPGridWindow sharedGridWindow] isHidden] == false) {
                [[SUPGridWindow sharedGridWindow] toggleHidden];
            }
            // call the add assertion check UI sequence
            [[AnushkTestSDKManager shared] callAddAssertionCheck];
            
            lastview.layer.borderColor = NULL;
            lastview.layer.borderWidth = 0.0;
            lastview = nil;
            logger = [[AnushkTestSDKManager shared] getNewLogger];
            return;
        } else {
            // delete the log. useless
            [[AnushkTestSDKManager shared] removeLastLogger];
        }
        
        // undo any previous drawing if it exists
        if (lastview != nil) {
            lastview.layer.borderColor = NULL;
            lastview.layer.borderWidth = 0.0;
        }
        
        // remember this control for erasing next time
        lastview = tempview;
        logger = [[AnushkTestSDKManager shared] getNewLogger];

        return; // without logging touches below or triggering the uiview response flow
    }
    
    if (!logger.isFloatButton) {
        
        switch (event.type) {
                
            case 0:
                // this is necessarilly whenever the user is clicking a control but
                // the control may or may not send the event
                if ([[AnushkTestSDKManager shared] logAllTouch] == false) {
                    //off
                } else {
                    //on
                    temp = @"UIEventTypeTouches";
                    allClicksLogged = @"true";
                }
                //temp = @"UIEventTypeTouches";
                break;
            case 1:
                if (event.subtype == 1) {
                    temp = @"UIEventSubtypeMotionShake";
                } else {
                    temp = @"UIEventTypeMotion";
                }
                break;
            case 2:
                switch (event.subtype) {
                    case 100:
                        temp = @"UIEventSubtypeRemoteControlPlay";
                        break;
                    case 101:
                        temp = @"UIEventSubtypeRemoteControlPause";
                        break;
                    case 102:
                        temp = @"UIEventSubtypeRemoteControlStop";
                        break;
                    case 103:
                        temp = @"UIEventSubtypeRemoteControlTogglePlayPause";
                        break;
                    case 104:
                        temp = @"UIEventSubtypeRemoteControlNextTrack";
                        break;
                    case 105:
                        temp = @"UIEventSubtypeRemoteControlPreviousTrack";
                        break;
                    case 106:
                        temp = @"UIEventSubtypeRemoteControlBeginSeekingBackward";
                        break;
                    case 107:
                        temp = @"UIEventSubtypeRemoteControlEndSeekingBackward";
                        break;
                    case 108:
                        temp = @"UIEventSubtypeRemoteControlBeginSeekingForward";
                        break;
                    case 109:
                        temp = @"UIEventSubtypeRemoteControlEndSeekingForward";
                        break;
                    default:
                        temp = @"UIEventTypeRemoteControl";
                }
            case 3:
                temp = @"UIEventTypePresses";
                break;
            case UIEventTypeScroll:
                temp = @"UIEventTypeScroll";
                break;
            case UIEventTypeHover:
                temp = @"UIEventTypeHover";
                break;
            case UIEventTypeTransform:
                temp = @"UIEventTypeTransform";
                break;
        }
        
        eventType = temp;
        NSLog(@"%@", temp);
        //send back to server
        logger.allClicksLogged = allClicksLogged;
        logger.eventType = eventType;
        
        for (UITouch *touch in event.allTouches) {
            
            if (touch.phase == UITouchPhaseBegan) {
                // now this is a confirmation that the event was sent (called only once)
                NSLog(@"Event: %@: %@", @"touched...", touch.view);
                viewDetails = touch.view.description;
                logger.viewDetails = viewDetails;

                /** We log it only if there are any changes */
                
             //   if (tempSuperview != touch.view.superview) {
                    // The receiver’s superview, or nil if it has none.
                    tempSuperview = touch.view.superview;
                    
                    NSLog(@"Superview: %@", touch.view.superview);
                    superView = touch.view.superview.description;
                    logger.superView = superView;

                    // superview's property
                    //NSLog(@"%@", touch.view.bounds);
                    NSLog(@"bounds: %@", NSStringFromCGRect(touch.view.superview.bounds));
                    superViewBound = NSStringFromCGRect(touch.view.superview.bounds);
                    logger.superViewBound = superViewBound;

                    NSLog(@"constraints: %@", touch.view.superview.constraints);
                    superViewConstrain = touch.view.superview.constraints.description;
                    logger.superViewConstrain = superViewConstrain;

                    NSLog(@"tags: %ld", (long)touch.view.superview.tag);
                    superViewTag = [NSString stringWithFormat:@"%ld", (long)touch.view.superview.tag];
                    logger.superViewTag = superViewTag;

             //   }
                
                //if (tempSubview != touch.view.subviews.firstObject) {
                    // The receiver’s immediate subviews.
                 //   tempSubview = touch.view.subviews.firstObject;
                    
                    NSLog(@"Subview: %@", touch.view.subviews);
                    receiverSubview = touch.view.subviews.description;
                    logger.receiverSubview = receiverSubview;
               // }
                
              //  if (tempWindow != touch.view.window) {
                    //The receiver’s window object, or nil if it has none.
                    NSLog(@"Receiver Window: %@", touch.view.window);
                    receiverWindow = touch.view.window.description;
                    logger.receiverWindow = receiverWindow;

             //   }
                
              //  if (tempMask != touch.view.maskView) {
                    //An optional view whose alpha channel is used to mask a view’s content.
                    NSLog(@"Optional mask view: %@", touch.view.maskView);
                    maskView = touch.view.maskView.description;
                    logger.maskView = maskView;

              //  }
                
            }
            
            // adding support for different touch phases
            NSLog(@"Logging the touch phase");
            if (touch.phase == UITouchPhaseBegan) {
                NSLog(@"a finger touched the surface.");
                uiTouchPhase = @"UITouchPhaseBegan";
            }
            
            if (touch.phase == UITouchPhaseEnded) {
                NSLog(@"a finger left the surface.");
                uiTouchPhase = @"UITouchPhaseEnded";
            }
            
            if (touch.phase == UITouchPhaseMoved) {
                NSLog(@"a finger moved on the surface.");
                uiTouchPhase = @"UITouchPhaseMoved";
            }
            
            if (touch.phase == UITouchPhaseCancelled) {
                NSLog(@"a touch doesn't end but we need to stop tracking (e.g. putting device to face)");
                uiTouchPhase = @"UITouchPhaseCancelled";
            }
            
            if (touch.phase == UITouchPhaseStationary) {
                NSLog(@"a finger is touching the surface but hasn't moved since the previous event.");
                uiTouchPhase = @"UITouchPhaseStationary";
            }
            
            logger.uiTouchPhase = uiTouchPhase;

            // tracking whether the user single-tapped, double-tapped, or even triple-tapped a particular view or window
            NSLog(@"Logging the kind of tap (sing/double/triple etc");
            
            // use the highest level of abstraction
            NSLog(@"Number is %@", @(touch.tapCount));
            tapCount =  [NSString stringWithFormat:@"%lu", (unsigned long)touch.tapCount];
            logger.tapCount = tapCount;

            // This property is available on devices that support 3D Touch or Apple Pencil
            if (@available(iOS 9.0, *)) {
                NSLog(@"Maximum possible force is %@", @(touch.maximumPossibleForce));
            } else {
                // Fallback on earlier versions
            }
            
            if (@available(iOS 9.0, *)) {
                maxPossForce = [NSString stringWithFormat: @"%.2f", touch.maximumPossibleForce];
            } else {
                // Fallback on earlier versions
            }
            
            logger.maxPossForce = maxPossForce;

            
            NSLog(@"Timestamp %f", touch.timestamp);
            timeStamp = [NSString stringWithFormat:@"%ld", (long)touch.timestamp];
            logger.timeStamp = timeStamp;

            if (@available(iOS 9.0, *)) {
                NSLog(@"Type of Touch: %ld", (long)touch.type);
            } else {
                // Fallback on earlier versions
            }
            
            // A direct touch from a finger (on a screen)
            if (@available(iOS 9.0, *)) {
                if (touch.type == UITouchTypeDirect) {
                    NSLog(@"UITouchTypeDirect");
                    typeOfTouch = @"UITouchTypeDirect";
                    
                }
            } else {
                // Fallback on earlier versions
            }
            
            // A touch from a stylus
            if (@available(iOS 9.1, *)) {
                if (touch.type == UITouchTypeStylus) {
                    NSLog(@"UITouchTypeStylus");
                    typeOfTouch = @"UITouchTypeStylus";
                }
            } else {
                // Fallback on earlier versions
            }
            
            // An indirect touch (not a screen)
            if (@available(iOS 9.0, *)) {
                if (touch.type == UITouchTypeIndirect) {
                    NSLog(@"UITouchTypeIndirect");
                    typeOfTouch = @"UITouchTypeIndirect";
                    
                }
            } else {
                // Fallback on earlier versions
            }
            
            if (@available(iOS 9.0, *)) {
                if (touch.type == UITouchTypeIndirect) {
                    NSLog(@"UITouchTypeIndirect");
                    typeOfTouch = @"UITouchTypeIndirect";
                }
            } else {
                // Fallback on earlier versions
            }
            
            logger.typeOfTouch = typeOfTouch;

            
            NSLog(@"Gesture recognizers at work %@", touch.gestureRecognizers);
            [gestureRecognizers addObject: touch.gestureRecognizers.description];
            logger.gestureRecognizers = [[gestureRecognizers valueForKey:@"description"] componentsJoinedByString:@""];
            
            
            logger.action = temp;
            logger.senderOld = touch.view;
            logger.event = event;
                        
        }
        
        logger.timesincestartup_on_end = [[NSProcessInfo processInfo] systemUptime];
        [logger callUploadRequest];
        
        for (UITouch *touch in event.allTouches) {
             if (touch.phase == UITouchPhaseEnded && !([touch.view isKindOfClass:[UIControl class]])) {
                 //[[AnushkTestSDKManager shared] removeLastLogger];
                 logger = [[AnushkTestSDKManager shared] getNewLogger];
                 //return;
             }
         }
        
    }

    [self interceptAndSendEvent:event];
}

@end
