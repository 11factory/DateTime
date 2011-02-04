#import <Foundation/Foundation.h>

@interface NSDate (DateTime)

+(id) yesterday;
+(id) tomorrow;
+(id) dateWithYear:(int)year month:(int)month andDay:(int)day;

-(bool) isToday;
-(id) dateByAddingDays:(int)days;
-(float) daysFromDate:(NSDate *)date;
-(float) daysToDate:(NSDate *)date;
-(bool) isAfterDate:(NSDate *)date;
-(bool) isAfterDateTime:(NSDate *)dateTime;
-(bool) isBeforeDate:(NSDate *)date;
-(bool) isBeforeDateTime:(NSDate *)dateTime;
-(bool) isSameDayThanDate:(NSDate *)date;
-(bool) isSameDateTimeThanDateTime:(NSDate *)dateTime;
-(int) day;
-(int) month;
-(int) year;
@end
