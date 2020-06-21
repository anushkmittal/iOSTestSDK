// Generated by Apple Swift version 5.2.4 (swiftlang-1103.0.32.9 clang-1103.0.32.53)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(ns_consumed)
# define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
# define SWIFT_RELEASES_ARGUMENT
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreGraphics;
@import Foundation;
@import ObjectiveC;
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="AnushkTestSDK",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

@class SUPGridWindow;
@class AnushkTestSDKLogger;

SWIFT_CLASS("_TtC13AnushkTestSDK13AnushkTestSDK")
@interface AnushkTestSDK : NSObject
@property (nonatomic) BOOL DEBUGGING;
@property (nonatomic) BOOL logAllTouch;
@property (nonatomic) BOOL dont_log_mode;
@property (nonatomic) BOOL isAssertValid;
@property (nonatomic, strong) SUPGridWindow * _Nullable grid;
- (void)loginWithApplicationID:(NSString * _Nonnull)appID allowScreenshots:(BOOL)allowScreenshots logAllTouches:(BOOL)logAllTouches showButton:(BOOL)showButton enableConsoleLogging:(BOOL)enableConsoleLogging saveScreenshotsLocally:(BOOL)saveScreenshotsLocally;
- (AnushkTestSDKLogger * _Nonnull)getNewLogger SWIFT_WARN_UNUSED_RESULT;
- (void)removeLastLogger;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class Floaty;

/// Optional delegate that can be used to be notified whenever the user
/// taps on a FAB that does not contain any sub items.
SWIFT_PROTOCOL("_TtP13AnushkTestSDK14FloatyDelegate_")
@protocol FloatyDelegate
@optional
/// Indicates that the user has tapped on a FAB widget that does not
/// contain any defined sub items.
/// \param floaty The FAB widget that was selected by the user.
///
- (void)emptyFloatySelected:(Floaty * _Nonnull)floaty;
- (BOOL)floatyShouldOpen:(Floaty * _Nonnull)floaty SWIFT_WARN_UNUSED_RESULT;
- (void)floatyWillOpen:(Floaty * _Nonnull)floaty;
- (void)floatyDidOpen:(Floaty * _Nonnull)floaty;
- (BOOL)floatyShouldClose:(Floaty * _Nonnull)floaty SWIFT_WARN_UNUSED_RESULT;
- (void)floatyWillClose:(Floaty * _Nonnull)floaty;
- (void)floatyDidClose:(Floaty * _Nonnull)floaty;
- (BOOL)shallWorkHorizontal SWIFT_WARN_UNUSED_RESULT;
/// This method has been deprecated. Use floatyWillOpen and floatyDidOpen instead.
- (void)floatyOpened:(Floaty * _Nonnull)floaty;
/// This method has been deprecated. Use floatyWillClose and floatyDidClose instead.
- (void)floatyClosed:(Floaty * _Nonnull)floaty;
@end


@interface AnushkTestSDK (SWIFT_EXTENSION(AnushkTestSDK)) <FloatyDelegate>
- (void)callAddAssertionCheck;
- (void)callAddAssertionLastAction;
@end

@class UIEvent;
@class UIImage;

SWIFT_CLASS("_TtC13AnushkTestSDK19AnushkTestSDKLogger")
@interface AnushkTestSDKLogger : NSObject
@property (nonatomic) NSInteger timesincestartup_on_end;
@property (nonatomic) BOOL isFloatButton;
@property (nonatomic) BOOL isAnAssertionLog;
@property (nonatomic, copy) NSString * _Nonnull isUIControl;
@property (nonatomic, copy) NSString * _Nonnull stateUIControl;
@property (nonatomic, copy) NSString * _Nonnull isEnabled;
@property (nonatomic, copy) NSString * _Nonnull isSelected;
@property (nonatomic, copy) NSString * _Nonnull isHighlighted;
@property (nonatomic, copy) NSString * _Nonnull bounds;
@property (nonatomic, copy) NSString * _Nonnull constrains;
@property (nonatomic, copy) NSString * _Nonnull tags;
@property (nonatomic, copy) NSString * _Nonnull accessibilityLabell;
@property (nonatomic, copy) NSString * _Nonnull accessibilityFramee;
@property (nonatomic, copy) NSString * _Nonnull allClicksLogged;
@property (nonatomic, copy) NSString * _Nonnull eventType;
@property (nonatomic, copy) NSString * _Nonnull viewDetails;
@property (nonatomic, copy) NSString * _Nonnull superView;
@property (nonatomic, copy) NSString * _Nonnull superViewBound;
@property (nonatomic, copy) NSString * _Nonnull superViewConstrain;
@property (nonatomic, copy) NSString * _Nonnull superViewTag;
@property (nonatomic, copy) NSString * _Nonnull receiverSubview;
@property (nonatomic, copy) NSString * _Nonnull receiverWindow;
@property (nonatomic, copy) NSString * _Nonnull maskView;
@property (nonatomic, copy) NSString * _Nonnull uiTouchPhase;
@property (nonatomic, copy) NSString * _Nonnull tapCount;
@property (nonatomic, copy) NSString * _Nonnull maxPossForce;
@property (nonatomic, copy) NSString * _Nonnull timeStamp;
@property (nonatomic, copy) NSString * _Nonnull typeOfTouch;
@property (nonatomic, copy) NSString * _Nonnull gestureRecognizers;
@property (nonatomic, copy) NSString * _Nonnull comments;
@property (nonatomic, copy) NSString * _Nonnull tree;
@property (nonatomic, copy) NSString * _Nonnull action;
@property (nonatomic, strong) id _Nullable senderOld;
@property (nonatomic, strong) UIEvent * _Nullable event;
@property (nonatomic, strong) UIImage * _Nullable screenshot;
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> * _Nonnull assert_items;
- (void)callUploadRequest;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC13AnushkTestSDK20AnushkTestSDKManager")
@interface AnushkTestSDKManager : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) AnushkTestSDK * _Nonnull shared;)
+ (AnushkTestSDK * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSURLSession;
@class NSURLSessionDataTask;
@class NSURLSessionTask;
@class NSURLAuthenticationChallenge;
@class NSURLCredential;
@class NSURLSessionDownloadTask;

/// Absorb all the delegates methods of NSURLSession and forwards them to pretty closures.
/// This is basically the sin eater for NSURLSession.
SWIFT_CLASS("_TtC13AnushkTestSDK15DelegateManager")
@interface DelegateManager : NSObject <NSURLSessionDataDelegate, NSURLSessionDownloadDelegate>
- (void)URLSession:(NSURLSession * _Nonnull)session dataTask:(NSURLSessionDataTask * _Nonnull)dataTask didReceiveData:(NSData * _Nonnull)data;
- (void)URLSession:(NSURLSession * _Nonnull)session task:(NSURLSessionTask * _Nonnull)task didCompleteWithError:(NSError * _Nullable)error;
- (void)URLSession:(NSURLSession * _Nonnull)session task:(NSURLSessionTask * _Nonnull)task didReceiveChallenge:(NSURLAuthenticationChallenge * _Nonnull)challenge completionHandler:(void (^ _Nonnull)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler;
- (void)URLSession:(NSURLSession * _Nonnull)session task:(NSURLSessionTask * _Nonnull)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend;
- (void)URLSession:(NSURLSession * _Nonnull)session downloadTask:(NSURLSessionDownloadTask * _Nonnull)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite;
- (void)URLSession:(NSURLSession * _Nonnull)session downloadTask:(NSURLSessionDownloadTask * _Nonnull)downloadTask didFinishDownloadingToURL:(NSURL * _Nonnull)location;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class FloatyItem;
@class UIColor;
enum FloatyOpenAnimationType : NSInteger;
enum FloatyVerticalDirection : NSInteger;
enum FloatyHorizontalDirection : NSInteger;
@class NSCoder;
enum FloatyItemLabelPositionType : NSInteger;
@class UITouch;

/// Floaty Object. It has <code>FloatyItem</code> objects.
/// Floaty support storyboard designable.
IB_DESIGNABLE
SWIFT_CLASS("_TtC13AnushkTestSDK6Floaty")
@interface Floaty : UIView
/// <code>FloatyItem</code> objects.
@property (nonatomic, copy) NSArray<FloatyItem *> * _Nonnull items;
/// This object’s button size.
@property (nonatomic) CGFloat size;
/// This circleAnimationRadius.
@property (nonatomic) double circleAnimationRadius;
/// This circleAnimationDegreeOffset.
@property (nonatomic) double circleAnimationDegreeOffset;
/// Padding from bottom right of UIScreen or superview.
@property (nonatomic) CGFloat paddingX;
@property (nonatomic) CGFloat paddingY;
/// Automatically closes child items when tapped
@property (nonatomic) IBInspectable BOOL autoCloseOnTap;
/// Automatically closes when tappen on overlay
@property (nonatomic) IBInspectable BOOL autoCloseOnOverlayTap;
/// Runs first item handler directly on tap (without opening menu)
@property (nonatomic) IBInspectable BOOL handleFirstItemDirectly;
/// Places button relative to the Safe Area
@property (nonatomic) IBInspectable BOOL relativeToSafeArea;
/// Degrees to rotate image
@property (nonatomic) IBInspectable CGFloat rotationDegrees;
/// Animation speed of buttons
@property (nonatomic) IBInspectable double animationSpeed;
/// Button color.
@property (nonatomic, strong) IBInspectable UIColor * _Nonnull buttonColor;
/// Button highlighted color.
@property (nonatomic, strong) IBInspectable UIColor * _Nullable buttonHighlightedColor;
/// Button shadow color.
@property (nonatomic, strong) IBInspectable UIColor * _Nonnull buttonShadowColor;
/// Button image.
@property (nonatomic, strong) IBInspectable UIImage * _Nullable buttonImage;
/// Plus icon color inside button.
@property (nonatomic, strong) IBInspectable UIColor * _Nonnull plusColor;
/// Background overlaying color.
@property (nonatomic, strong) IBInspectable UIColor * _Nonnull overlayColor;
/// The space between the item and item.
@property (nonatomic) IBInspectable CGFloat itemSpace;
/// Child item’s default size.
@property (nonatomic) IBInspectable CGFloat itemSize;
/// Child item’s default button color.
@property (nonatomic, strong) IBInspectable UIColor * _Nonnull itemButtonColor;
/// Child item’s default title label color.
@property (nonatomic, strong) IBInspectable UIColor * _Nonnull itemTitleColor;
/// Child item’s image color
@property (nonatomic, strong) IBInspectable UIColor * _Nullable itemImageColor;
/// Enable/disable shadow.
@property (nonatomic) IBInspectable BOOL hasShadow;
/// Child item’s default shadow color.
@property (nonatomic, strong) IBInspectable UIColor * _Nonnull itemShadowColor;
///
@property (nonatomic) BOOL closed;
/// Make the menu button draggable
@property (nonatomic) BOOL isDraggable;
/// Whether or not floaty responds to keyboard notifications and adjusts its position accordingly
@property (nonatomic) IBInspectable BOOL respondsToKeyboard;
@property (nonatomic) enum FloatyOpenAnimationType openAnimationType;
@property (nonatomic) enum FloatyVerticalDirection verticalDirection;
@property (nonatomic) enum FloatyHorizontalDirection horizontalDirection;
@property (nonatomic) BOOL friendlyTap;
@property (nonatomic) BOOL sticky;
/// Animations and spacing wll be horizontal not vertical
@property (nonatomic) IBInspectable BOOL supportLanscape;
/// Delegate that can be used to learn more about the behavior of the FAB widget.
@property (nonatomic, weak) IBOutlet id <FloatyDelegate> _Nullable fabDelegate;
/// Button selected color.
@property (nonatomic, strong) IBInspectable UIColor * _Nullable selectedColor;
/// Initialize with default property.
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
/// Initialize with custom frame.
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
/// Initialize from storyboard.
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
/// Set size and frame.
- (void)drawRect:(CGRect)rect;
/// Items open.
- (void)open;
/// Items close.
- (void)close;
/// Items open or close.
- (void)toggle;
/// Add custom item
- (void)addItemWithItem:(FloatyItem * _Nonnull)item;
/// Add item with title, titlePositon.
/// titlePosition’s default value is left.
- (FloatyItem * _Nonnull)addItemWithTitle:(NSString * _Nonnull)title titlePosition:(enum FloatyItemLabelPositionType)titlePosition;
/// Add item with title.
- (FloatyItem * _Nonnull)addItemWithTitle:(NSString * _Nonnull)title;
/// Add item with title, titlePosition and icon.
/// titlePosition’s default value is left.
- (FloatyItem * _Nonnull)addItem:(NSString * _Nonnull)title icon:(UIImage * _Nullable)icon titlePosition:(enum FloatyItemLabelPositionType)titlePosition;
/// Add item with title and icon.
- (FloatyItem * _Nonnull)addItem:(NSString * _Nonnull)title icon:(UIImage * _Nullable)icon;
/// Add item with title and handler.
- (FloatyItem * _Nonnull)addItemWithTitle:(NSString * _Nonnull)title handler:(void (^ _Nonnull)(FloatyItem * _Nonnull))handler;
/// Add item with titlePosition and handler.
/// titlePosition’s default value is left.
- (FloatyItem * _Nonnull)addItemWithTitle:(NSString * _Nonnull)title titlePosition:(enum FloatyItemLabelPositionType)titlePosition handler:(void (^ _Nonnull)(FloatyItem * _Nonnull))handler;
/// Add item with title, icon or handler.
- (FloatyItem * _Nonnull)addItem:(NSString * _Nonnull)title icon:(UIImage * _Nullable)icon handler:(void (^ _Nonnull)(FloatyItem * _Nonnull))handler;
/// Add item with title, icon, titlePosition or handler.
/// titlePosition’s default value is left
- (FloatyItem * _Nonnull)addItem:(NSString * _Nonnull)title icon:(UIImage * _Nullable)icon titlePosition:(enum FloatyItemLabelPositionType)titlePosition handler:(void (^ _Nonnull)(FloatyItem * _Nonnull))handler;
/// Add item with icon.
- (FloatyItem * _Nonnull)addItemWithIcon:(UIImage * _Nullable)icon;
/// Add item with icon and handler.
- (FloatyItem * _Nonnull)addItemWithIcon:(UIImage * _Nullable)icon handler:(void (^ _Nonnull)(FloatyItem * _Nonnull))handler;
/// Remove item.
- (void)removeItemWithItem:(FloatyItem * _Nonnull)item;
/// Remove item with index.
- (void)removeItemWithIndex:(NSInteger)index;
- (UIView * _Nullable)hitTest:(CGPoint)point withEvent:(UIEvent * _Nullable)event SWIFT_WARN_UNUSED_RESULT;
- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (void)touchesEnded:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (void)observeValueForKeyPath:(NSString * _Nullable)keyPath ofObject:(id _Nullable)object change:(NSDictionary<NSKeyValueChangeKey, id> * _Nullable)change context:(void * _Nullable)context;
- (void)willMoveToSuperview:(UIView * _Nullable)newSuperview;
- (void)didMoveToSuperview;
@end




@interface Floaty (SWIFT_EXTENSION(AnushkTestSDK))
- (void)layoutSubviews;
@property (nonatomic, copy) NSString * _Nullable accessibilityLabel;
@property (nonatomic, copy) NSString * _Nullable accessibilityHint;
@property (nonatomic, copy) NSString * _Nullable accessibilityValue;
@property (nonatomic, copy) NSArray * _Nullable accessibilityElements;
@end




typedef SWIFT_ENUM(NSInteger, FloatyHorizontalDirection, closed) {
  FloatyHorizontalDirectionLeft = 0,
  FloatyHorizontalDirectionRight = 1,
};

@class UILabel;
@class UIImageView;

/// Floating Action Button Object’s item.
SWIFT_CLASS("_TtC13AnushkTestSDK10FloatyItem")
@interface FloatyItem : UIView
/// This object’s button size.
@property (nonatomic) CGFloat size;
/// Button color.
@property (nonatomic, strong) UIColor * _Nonnull buttonColor;
/// Title label color.
@property (nonatomic, strong) UIColor * _Nonnull titleColor;
/// Enable/disable shadow.
@property (nonatomic) BOOL hasShadow;
/// Circle Shadow color.
@property (nonatomic, strong) UIColor * _Nonnull circleShadowColor;
/// Title Shadow color.
@property (nonatomic, strong) UIColor * _Nonnull titleShadowColor;
/// If you touch up inside button, it execute handler.
@property (nonatomic, copy) void (^ _Nullable handler)(FloatyItem * _Nonnull);
@property (nonatomic) CGPoint imageOffset;
@property (nonatomic) CGSize imageSize;
/// Item’s title label position.
/// deafult is left
@property (nonatomic) enum FloatyItemLabelPositionType titleLabelPosition;
@property (nonatomic, readonly, strong) UILabel * _Nonnull titleLabel;
/// Item’s title.
@property (nonatomic, copy) NSString * _Nullable title;
@property (nonatomic, readonly, strong) UIImageView * _Nonnull iconImageView;
/// Item’s icon.
@property (nonatomic, strong) UIImage * _Nullable icon;
/// Item’s icon tint color change
@property (nonatomic, strong) UIColor * _Null_unspecified iconTintColor;
/// Initialize with default property.
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
/// Set size, frame and draw layers.
- (void)drawRect:(CGRect)rect;
- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (void)touchesMoved:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (void)touchesEnded:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
@end

typedef SWIFT_ENUM(NSInteger, FloatyItemLabelPositionType, closed) {
  FloatyItemLabelPositionTypeLeft = 0,
  FloatyItemLabelPositionTypeRight = 1,
};


/// KCFloatingActionButton dependent on UIWindow.
SWIFT_CLASS("_TtC13AnushkTestSDK13FloatyManager")
@interface FloatyManager : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

typedef SWIFT_ENUM(NSInteger, FloatyOpenAnimationType, closed) {
  FloatyOpenAnimationTypePop = 0,
  FloatyOpenAnimationTypeFade = 1,
  FloatyOpenAnimationTypeSlideLeft = 2,
  FloatyOpenAnimationTypeSlideUp = 3,
  FloatyOpenAnimationTypeSlideDown = 4,
  FloatyOpenAnimationTypeFullCircular = 5,
  FloatyOpenAnimationTypeSemiCircular = 6,
  FloatyOpenAnimationTypeQuadCircular = 7,
  FloatyOpenAnimationTypeNone = 8,
};

typedef SWIFT_ENUM(NSInteger, FloatyVerticalDirection, closed) {
  FloatyVerticalDirectionUp = 0,
  FloatyVerticalDirectionDown = 1,
};

@class NSBundle;

/// KCFloatingActionButton dependent on UIWindow.
SWIFT_CLASS("_TtC13AnushkTestSDK20FloatyViewController")
@interface FloatyViewController : UIViewController
- (void)viewDidLoad;
@property (nonatomic, readonly) UIStatusBarStyle preferredStatusBarStyle;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end




@interface NSObject (SWIFT_EXTENSION(AnushkTestSDK))
- (NSDictionary<NSString *, id> * _Nonnull)toDictionary SWIFT_WARN_UNUSED_RESULT;
@end


/// RSSelectionMenuSearchDelegate
SWIFT_CLASS("_TtC13AnushkTestSDK29RSSelectionMenuSearchDelegate")
@interface RSSelectionMenuSearchDelegate : NSObject
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

@class UISearchBar;

@interface RSSelectionMenuSearchDelegate (SWIFT_EXTENSION(AnushkTestSDK)) <UISearchBarDelegate>
- (void)searchBarTextDidBeginEditing:(UISearchBar * _Nonnull)searchBar;
- (void)searchBarTextDidEndEditing:(UISearchBar * _Nonnull)searchBar;
- (void)searchBarSearchButtonClicked:(UISearchBar * _Nonnull)searchBar;
- (void)searchBarCancelButtonClicked:(UISearchBar * _Nonnull)searchBar;
- (void)searchBar:(UISearchBar * _Nonnull)searchBar textDidChange:(NSString * _Nonnull)searchText;
@end












@interface UIView (SWIFT_EXTENSION(AnushkTestSDK))
- (NSString * _Nonnull)getTreeWithProperties:(BOOL)properties SWIFT_WARN_UNUSED_RESULT;
@end






/// This is how to upload files in SwiftHTTP. The upload object represents a file to upload by either a data blob or a url (which it reads off disk).
SWIFT_CLASS("_TtC13AnushkTestSDK6Upload")
@interface Upload : NSObject <NSCoding>
/// Standard NSCoder support
- (void)encodeWithCoder:(NSCoder * _Nonnull)aCoder;
/// Required for NSObject support (because of NSCoder, it would be a struct otherwise!)
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder;
@end



#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop