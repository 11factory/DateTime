#import "DateTime.h"

@implementation NSDate (DateTime)
int DAY_IN_SECONDS = 60 * 60 * 24;

+(id) yesterday {
	return [[NSDate date] dateByAddingDays:-1];
}

+(id) tomorrow {
	return [[NSDate date] dateByAddingDays:1];
}

-(bool) isToday {
	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init]autorelease];
	[dateFormatter setDateFormat:@"yyyy-MM-dd"];
	NSDate *today = [NSDate date];
	return [[dateFormatter stringFromDate:today] isEqualToString:[dateFormatter stringFromDate:self]];
}

-(id) dateByAddingDays:(int)numberOfDays {
	return [self dateByAddingTimeInterval:DAY_IN_SECONDS * numberOfDays];
}

-(int) daysFromDate:(NSDate *)date {
	return [self timeIntervalSinceDate:date] / DAY_IN_SECONDS;	
}

-(int) daysToDate:(NSDate *)date {
	return [date timeIntervalSinceDate:self] / DAY_IN_SECONDS;		
}

-(bool) isAfterDate:(NSDate *)date {
	return [self daysToDate:date] < 0;
}

-(bool) isAfterDateTime:(NSDate *)dateTime {
	return [self timeIntervalSinceDate:dateTime] > 0;
}

-(bool) isBeforeDate:(NSDate *)date {
	return ![self isSameDayThanDate:date] && ![self isAfterDate:date];
}

-(bool) isBeforeDateTime:(NSDate *)dateTime {
	return ![self isSameDateTimeThanDateTime:dateTime] && ![self isAfterDateTime:dateTime];
}

-(bool) isSameDayThanDate:(NSDate *)date {
	return [self daysFromDate:date] == 0;
}

-(bool) isSameDateTimeThanDateTime:(NSDate *)dateTime {
	return [self timeIntervalSinceDate:dateTime] == 0;
}

@end
