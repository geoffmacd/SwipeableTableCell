//
//  TableViewCell.m
//  SwipeableTableCell
//
//  Created by Geoff MacDonald on 2014-11-22.
//  Copyright (c) 2014 Geoff MacDonald. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell () <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIButton *leftButton;
@property (strong, nonatomic) IBOutlet UIView *boxView;

@end

@implementation TableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    self.scrollView.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.boxView addGestureRecognizer:tap];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    [self.scrollView setContentOffset:CGPointZero animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x > 0.0) {
        scrollView.bounces = NO;
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self stoppedScrolling];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self stoppedScrolling];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self stoppedScrolling];
    }
}

- (void)stoppedScrolling
{
    self.scrollView.bounces = YES;
    
    if (self.scrollView.contentOffset.x > 0.0) {
        if (self.scrollView.contentOffset.x <= 70.0f) {
            
            [self.scrollView setContentOffset:CGPointZero animated:YES];
        } else {
            
            [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentSize.width- self.scrollView.frame.size.width, 0) animated:YES];
        }
    }
    
}

- (void)tapped:(id)sender
{
    [self setSelected:!self.selected];
}
@end
