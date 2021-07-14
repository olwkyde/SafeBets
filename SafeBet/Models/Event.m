//
//  Event.m
//  SafeBet
//
//  Created by Isaac Oluwakuyide on 7/13/21.
//

#import "Event 2.h"

@implementation Event

-(instancetype)initWithDictionary:(NSDictionary *)dictionary   {
    self = [super init];
    if (self)   {
        self.team1 = dictionary[@"home_team"];
        self.team2 = dictionary[@"away_team"];
        
        NSArray *bookmakers = dictionary[@"bookmakers"];
        NSDictionary *bookmaker = [bookmakers objectAtIndex:0];
        NSArray *markets = bookmaker[@"markets"];
        NSDictionary *market = [markets objectAtIndex:0];
        NSArray *outcomes = market[@"outcomes"];
        
        NSDictionary *odd1 = [outcomes objectAtIndex:0];
        NSDictionary *odd2 = [outcomes objectAtIndex:1];
        
        NSString *name1 = odd1[@"name"];
        
        if ([name1 isEqualToString:self.team1]) {
            self.team1Odds = (int) odd1[@"price"];
        }   else {
            self.team2Odds = (int) odd1[@"price"];
            self.team2Odds = (int) odd2[@"price"];
        }
        
        NSString *gameDate = dictionary[@"commence_time"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        formatter.dateFormat = @"h:mm a";
        self.time = [formatter dateFromString:gameDate];
        
        formatter.dateFormat = @"M/dd/yy";
        self.date = [formatter dateFromString: gameDate];
    }
    return self;
}

+ (NSMutableArray *)eventsWithArray:(NSArray *)dictionaries{
        NSMutableArray *events = [NSMutableArray array];
        for (NSDictionary *dictionary in dictionaries) {
            Event *event = [[Event alloc] initWithDictionary:dictionary];
            [events addObject:event];
        }
        return events;
}

@end
