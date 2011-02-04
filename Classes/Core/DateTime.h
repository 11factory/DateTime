#import <Foundation/Foundation.h>

@interface NSDate (DateTime)

+(id) yesterday;
+(id) tomorrow;
+(id) dateWithYear:(int)year month:(int)month andDay:(int)day;

-(bool) isToday;
-(id) dateByAddingDays:(int)days;
-(int) daysFromDate:(NSDate *)date;
-(int) daysToDate:(NSDate *)date;
-(bool) isAfterDate:(NSDate *)date;
-(bool) isAfterDateTime:(NSDate *)dateTime;
-(bool) isBeforeDate:(NSDate *)date;
-(bool) isBeforeDateTime:(NSDate *)dateTime;
-(bool) isSameDayThanDate:(NSDate *)date;
-(bool) isSameDateTimeThanDateTime:(NSDate *)dateTime;
@end
