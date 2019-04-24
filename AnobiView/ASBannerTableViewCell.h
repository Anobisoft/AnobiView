//
//  ASBannerTableViewCell.h
//  AnobiView
//
//  Created by Stanislav Pletnev on 22/04/2019.
//  Copyright © 2019 Anobisoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ASBannerTitleModeNone,
    ASBannerTitleModeLowercase,
    ASBannerTitleModeUppercase,
    ASBannerTitleModeCapitalized,
} ASBannerTitleMode;

NS_ASSUME_NONNULL_BEGIN

@interface ASBannerTableViewCell : UITableViewCell

@property (nonatomic, readonly) IBOutlet UIImageView *bannerView;
@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic) ASBannerTitleMode titleMode;

/** transition defaults:
 duration : 1.3
 type     : kCATransitionPush
 subtype  : kCATransitionFromRight
 transitionTimingFunction : EaseInEaseOut
 */
@property (nonatomic, readonly) CATransition *transition;


- (void)changeBannerImage:(nullable UIImage *)image withTitle:(nullable NSString *)title;
- (void)changeBannerImage:(nullable UIImage *)image withTitle:(nullable NSString *)title
               completion:(nullable dispatch_block_t)completion;

@end

NS_ASSUME_NONNULL_END
