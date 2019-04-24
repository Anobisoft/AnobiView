//
//  ASBannerTableViewCell.m
//  AnobiView
//
//  Created by Stanislav Pletnev on 22/04/2019.
//  Copyright © 2019 Anobisoft. All rights reserved.
//

#import "ASBannerTableViewCell.h"

@interface ASBannerTableViewCell ()

@property (nonatomic, readwrite) IBOutlet UIImageView *bannerView;

@end

@implementation ASBannerTableViewCell

- (instancetype)init {
    self = [super init];
    if (self) {
        [self defaultsInit];
        [self configView];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self defaultsInit];
        [self configView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultsInit];
        [self configView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self defaultsInit];
    }
    return self;
}

- (void)defaultsInit {
    self.backgroundColor = UIColor.clearColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configView];
}

- (UIImageView *)bannerView {
    if (!_bannerView) {
        _bannerView = [UIImageView new];
        _bannerView.contentMode = UIViewContentModeScaleAspectFill;
        _bannerView.clipsToBounds = YES;
        [self.contentView addSubview:_bannerView];
        [self addBannerViewConstraints];
    }
    return _bannerView;
}

- (void)configView {
    UIView *superview = self.titleLabel.superview;
    while (superview) {
        if (superview == self.bannerView) {
            break;
        }
        superview = superview.superview;
    }
    if (!superview) {
        [self.bannerView addSubview:self.titleLabel];
        [self addTitleLabelConstraints];
    }
}

@synthesize titleLabel = _titleLabel;
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = UIColor.whiteColor;
    }
    return _titleLabel;
}

@synthesize transition = _transition;
- (CATransition *)transition {
    if (!_transition) {
        _transition = [CATransition animation];
        _transition.duration = 1.3;
        _transition.type = kCATransitionPush;
        _transition.subtype = kCATransitionFromRight;
        _transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    }
    return _transition;
}

- (void)addBannerViewConstraints {
    self.bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.bannerView setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                     forAxis:UILayoutConstraintAxisVertical];
    [self.bannerView setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                     forAxis:UILayoutConstraintAxisHorizontal];
    [self.bannerView setContentHuggingPriority:UILayoutPriorityRequired
                                       forAxis:UILayoutConstraintAxisVertical];
    [self.bannerView setContentHuggingPriority:UILayoutPriorityRequired
                                       forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.bannerView.topAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.topAnchor].active = YES;
    [self.bannerView.leftAnchor constraintEqualToAnchor:self.contentView.layoutMarginsGuide.leftAnchor].active = YES;
    [self.bannerView.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor].active = YES;
    [self.bannerView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
}

- (void)addTitleLabelConstraints {
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.titleLabel.topAnchor constraintEqualToAnchor:self.bannerView.topAnchor constant:4.0].active = YES;
    [self.titleLabel.leftAnchor constraintEqualToAnchor:self.bannerView.leftAnchor constant:8.0].active = YES;
    [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.bannerView.centerXAnchor].active = YES;
    [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.bannerView.centerYAnchor].active = YES;
}

- (void)changeBannerImage:(UIImage *)image withTitle:(NSString *)title {
    [self changeBannerImage:image withTitle:title completion:nil];
}

- (void)changeBannerImage:(UIImage *)image withTitle:(NSString *)title
               completion:(dispatch_block_t)completion {
    
    switch (self.titleMode) {
        case ASBannerTitleModeLowercase: {
            title = title.lowercaseString;
            break;
        }
        case ASBannerTitleModeUppercase: {
            title = title.uppercaseString;
            break;
        }
        case ASBannerTitleModeCapitalized: {
            title = title.capitalizedString;
            break;
        }
        default: // ASBannerTitleModeNone
            break;
    }

    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self.bannerView.layer addAnimation:self.transition forKey:kCATransition];
    self.bannerView.image = image;
    self.titleLabel.text = title;
    [CATransaction commit];
}

@end
