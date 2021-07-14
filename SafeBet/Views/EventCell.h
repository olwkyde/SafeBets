//
//  EventCell.h
//  SafeBet
//
//  Created by Isaac Oluwakuyide on 7/13/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EventCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *team1Label;
@property (weak, nonatomic) IBOutlet UILabel *team2Label;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *team1OddsLabel;
@property (weak, nonatomic) IBOutlet UILabel *team2OddsLabel;

@end

NS_ASSUME_NONNULL_END
