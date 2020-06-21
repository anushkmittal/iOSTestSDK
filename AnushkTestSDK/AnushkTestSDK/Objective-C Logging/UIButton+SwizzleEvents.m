//
//  UIButton+SwizzleEvents.m
//  AnushkTestSDK
//
//  Created by Anushk Mittal on 1/19/17.
//  Copyright © 2017 Anushk Mittal. All rights reserved.
//


#import "UIButton+SwizzleEvents.h"
#import <objc/runtime.h>
#import "UIApplication+swizzle.h"

#define NSLog if([[MoQuaityManager shared] DEBUGGING] == true)NSLog

void standard_swizzle(Class cls, SEL original, SEL replacement)
{
    Method originalMethod;
    if ((originalMethod = class_getClassMethod(cls, original))) { //selectors for classes take priority over instances should there be a -propertyName and +propertyName
        Method replacementMethod = class_getClassMethod(cls, replacement);
        method_exchangeImplementations(originalMethod, replacementMethod);  //because class methods are really just statics, there's no method hierarchy to preserve, so we can directly exchange IMPs
    } else {
        //get the replacement IMP
        //set the original IMP on the replacement selector
        //try to add the replacement IMP directly to the class on original selector
        //if it succeeds then we're all good (the original before was located on the superclass)
        //if it doesn't then that means an IMP is already there so we have to overwrite it
        IMP replacementImplementation = method_setImplementation(class_getInstanceMethod(cls, replacement), class_getMethodImplementation(cls, original));
        if (!class_addMethod(cls, original, replacementImplementation, method_getTypeEncoding(class_getInstanceMethod(cls, replacement)))) method_setImplementation(class_getInstanceMethod(cls, original), replacementImplementation);
    }
}

@implementation UIButton (SwizzleEvents)

+(void)load
{
    if (self == [UIButton class]) {
        //NSLog(self);
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSArray *methods = @[@"beginTrackingWithTouch:withEvent:"];
            for (NSString* methodName in methods) {
                standard_swizzle(self, NSSelectorFromString(methodName), NSSelectorFromString([NSString stringWithFormat:@"new_%@", methodName]));
            }
        });
        
    }
}
-(BOOL)new_beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    /*
     (Execute befor your ibaction/action method call)
     */
    
    //  NSLog(@"Old legacy button only logging: Button was touched");
    
    
    return [self new_beginTrackingWithTouch:touch withEvent:event];
    
    //NSLog(@"after action method call");
    
    /*
     (Execute after your ibaction/action method call)
     */
}
@end
