//
//  AlarmTableViewCell.m
//  Dulgi
//
//  Created by Byoung Jin Yu on 12. 8. 26..
//  Copyright (c) 2012년 y2. All rights reserved.
//

#import "AlarmTableViewCell.h"

@implementation AlarmTableViewCell

@synthesize lblTitle;
@synthesize swcAlarm;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
