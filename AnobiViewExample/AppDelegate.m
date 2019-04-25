//
//  AppDelegate.m
//  AnobiView
//
//  Created by Stanislav Pletnev on 08/02/2017.
//  Copyright © 2017 Anobisoft. All rights reserved.
//

#import "AppDelegate.h"
#import <AnobiView/AnobiView.h>
#import <AnobiUIKit/AnobiUIKit.h>

@interface AppDelegate () <UIAlertConfigurator, UITableViewDataSource>

@property (nonatomic) ASBannerTableViewCell *cell;
@property (nonatomic) NSTimer *timer;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [ASGradientView appearance].startPoint = CGPointMake(0, 0.2);
    [ASGradientView appearance].endPoint = CGPointMake(1, 2);
    
    [UIButton appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].titleTextColor = [UIColor whiteColor];
    [UINavigationBar appearance].barTintColor = [UIColor redColor];
    [UIToolbar appearance].barTintColor = [UIColor redColor];
    
    [self addButton];
    
    for (UITableView *view in self.rootNavigationController.viewControllers.firstObject.view.subviews) {
        if ([view isKindOfClass:UITableView.class]) {
            view.dataSource = self;
            [view reloadData];
        }
    }
    
    self.timer = [NSTimer timerWithTimeInterval:4 target:self selector:@selector(changeBanner) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    
    return YES;
}

- (void)changeBanner {
    static NSArray *banners = nil;
    if (!banners) {
        banners = @[@"gradient", @"grid", @"grainbow"];
    }
    static NSUInteger i = 0;
    NSString *name = banners[++i % banners.count];
    UIImage *image = [UIImage imageNamed:name];
    [self.cell changeBannerImage:image withTitle:name];
}

- (UINavigationController *)rootNavigationController {
    return (UINavigationController *)self.window.rootViewController;
}

- (void)addButton {
    UIView *rootView = self.rootNavigationController.viewControllers.firstObject.view;
    UIView *grainbomatedView = nil;
    for (UIView *view in rootView.subviews) {
        if ([view isKindOfClass:ASGrainbomatedView.class]) {
            grainbomatedView = view;
            break;
        }
    }
    UIButton *button = [UIButton autolayoutView];
    [grainbomatedView addSubview:button];
    
    [button setTitle:@"Action" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    
    [button.centerXAnchor constraintEqualToAnchor:grainbomatedView.centerXAnchor].active = YES;
    [button.centerYAnchor constraintEqualToAnchor:grainbomatedView.centerYAnchor].active = YES;
    [button.leftAnchor constraintEqualToAnchor:grainbomatedView.leftAnchor].active = YES;
    [button.topAnchor constraintEqualToAnchor:grainbomatedView.topAnchor].active = YES;    
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction:(UIButton *)sender {
    [self.rootNavigationController showAlert:@"Action" actions:@[UIAlertOKAction(nil)] configurator:self];
}

- (UIAlertControllerStyle)alertControllerPreferredStyle {
    return UIAlertControllerStyleAlert;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cell;
}

- (ASBannerTableViewCell *)cell {
    if (!_cell) {
        _cell = [ASBannerTableViewCell new];
        NSString *name = @"gradient";
        _cell.bannerView.image = [UIImage imageNamed:name];
        _cell.titleLabel.text = name;
    }
    return _cell;
}


@end
