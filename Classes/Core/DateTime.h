#import <Foundation/Foundation.h>

@interface NSDate (DateTime)
	
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
+(id) yesterday;
+(id) tomorrow;
@end
