//
//  ShareSheetModule.m
//  AirdropSampleRN
//
//  Created by Tarun Bardawa on 29/05/24.
//

#import "ShareSheetModule.h"
#import <React/RCTLog.h>
#import <UIKit/UIKit.h>

@interface AirDropOnlyActivityItemSource : NSObject <UIActivityItemSource>

@property (nonatomic, strong) id item;

- (instancetype)initWithItem:(id)item;

@end

@implementation AirDropOnlyActivityItemSource

- (instancetype)initWithItem:(id)item {
  self = [super init];
  if (self) {
    self.item = item;
  }
  return self;
}

- (id)activityViewControllerPlaceholderItem:(UIActivityViewController *)activityViewController {
  return [NSURL URLWithString:@""];
}

- (id)activityViewController:(UIActivityViewController *)activityViewController itemForActivityType:(NSString *)activityType {
  return self.item;
}

@end

@implementation ShareSheetModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(openShareSheet:(NSString *)textToShare) {
  dispatch_async(dispatch_get_main_queue(), ^{
    NSArray *itemsToShare = @[textToShare];
    
    AirDropOnlyActivityItemSource *activityItemSource = [[AirDropOnlyActivityItemSource alloc] initWithItem:itemsToShare.firstObject];
    
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[activityItemSource] applicationActivities:nil];
    
    UIViewController *rootViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    [rootViewController presentViewController:activityViewController animated:YES completion:nil];
  });
}

@end

