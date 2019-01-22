//
//  EmployeeTableViewCell.m
//  Assignment
//
//  Created by Timofey Kuzmin on 22/01/2019.
//  Copyright © 2019 Timofey Kuzmin. All rights reserved.
//

#import "EmployeeTableViewCell.h"

@interface EmployeeTableViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *birthYearLabel;
@property (nonatomic, strong) UILabel *salaryLabel;

@end

@implementation EmployeeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)configureWith:(Employee*)employee {
    self.nameLabel.text = employee.name;
    self.birthYearLabel.text = [NSString stringWithFormat:@"%li", employee.birthYear];
    // self.salaryLabel.text = [employee formatSalary]; is the performance bottleneck
    // solved with _salaryString
    self.salaryLabel.text = employee.salaryString;
}

#pragma mark - Privates

- (void)setupViews {
    self.nameLabel = [UILabel new];
    self.nameLabel.numberOfLines = 0;
    self.nameLabel.backgroundColor = [UIColor greenColor];
    [self.nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeading
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.nameLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0
                                                                  constant:-8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.nameLabel
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    self.birthYearLabel = [UILabel new];
    self.birthYearLabel.numberOfLines = 0;
    self.birthYearLabel.textAlignment = NSTextAlignmentRight;
    self.birthYearLabel.backgroundColor = [UIColor redColor];
    [self.birthYearLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.birthYearLabel];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.birthYearLabel
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.birthYearLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:-8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.birthYearLabel
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1.0
                                                                  constant:0.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.birthYearLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0
                                                                  constant:-8.0]];
    
    self.salaryLabel = [UILabel new];
    self.salaryLabel.numberOfLines = 0;
    self.salaryLabel.textAlignment = NSTextAlignmentRight;
    self.salaryLabel.backgroundColor = [UIColor yellowColor];
    [self.salaryLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:self.salaryLabel];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.salaryLabel
                                                                 attribute:NSLayoutAttributeTrailing
                                                                multiplier:1.0
                                                                  constant:8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.salaryLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1.0
                                                                  constant:8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.salaryLabel
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:1.0
                                                                  constant:0.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.nameLabel
                                                                 attribute:NSLayoutAttributeTrailing
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.salaryLabel
                                                                 attribute:NSLayoutAttributeLeading
                                                                multiplier:1.0
                                                                  constant:-8.0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.birthYearLabel
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.salaryLabel
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:-8.0]];
}

@end
