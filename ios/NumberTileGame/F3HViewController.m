//
//  F3HViewController.m
//  NumberTileGame
//
//  Created by Austin Zheng on 3/22/14.
//
//

#import "F3HViewController.h"

#import "F3HNumberTileGameViewController.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface F3HViewController ()
@end

@implementation F3HViewController

- (IBAction)playGameButtonTapped:(id)sender {
    F3HNumberTileGameViewController *c = [F3HNumberTileGameViewController numberTileGameWithDimension:4
                                                                                         winThreshold:2048
                                                                                      backgroundColor:[UIColor whiteColor]
                                                                                          scoreModule:YES
                                                                                       buttonControls:NO
                                                                                        swipeControls:YES];
    [self presentViewController:c animated:YES completion:nil];
}

- (IBAction)highScoreButtonPressed:(id)sender {
    NSLog(@"High Score Button Pressed");
    NSURL *jsCodeLocation;
    
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"RNHighScores"
                                                 initialProperties:
                             @{
                               @"scores": @[
                                       @{
                                           @"name": @"Alex",
                                           @"value": @"42"
                                           },
                                       @{
                                           @"name": @"Joel",
                                           @"value": @"10"
                                           }
                                       ]
                               }
                                                     launchOptions:nil];
    rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
    UIViewController *vc = [UIViewController new];
    vc.view = rootView;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
