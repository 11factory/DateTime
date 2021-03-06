#import "DateTimeTest.h"
#import "DateTime.h"

@implementation DateTimeTest
int DAY = 60 * 60 * 24;
NSDate *now;
NSDate *tomorrow;
NSDate *nowPlus30Seconds;
NSDate *fev052011;

-(void) setUp {
	now = [NSDate date];
	tomorrow = [NSDate tomorrow];
	nowPlus30Seconds = [now dateByAddingTimeInterval:30];
	fev052011 = [NSDate dateWithTimeIntervalSince1970:15010 * DAY];
}

-(void) assertDate:(NSDate *)actual isEqualToDate:(NSDate *)expected {
	STAssertEqualObjects([actual description], [expected description], nil);
}

-(void) testCanCheckIfDateIsToday {
	STAssertTrue([now isToday], nil);
	STAssertFalse([[now dateByAddingTimeInterval:DAY] isToday], nil);
}

-(void) testCanAddDaysToDate {
	[self assertDate:[now dateByAddingDays:1] isEqualToDate:tomorrow];
}

-(void) testCanGetYesterdayDate {
	[self assertDate:[NSDate yesterday] isEqualToDate:[now dateByAddingDays:-1]];
}

-(void) testCanGetTomorrowDate {
	[self assertDate:[NSDate tomorrow] isEqualToDate:[now dateByAddingDays:1]];
}

-(void) testCanGetNumberOfDaysFromAnotherDate {
	STAssertEqualObjects([NSNumber numberWithInt:[tomorrow daysFromDate:now]], [NSNumber numberWithInt:1], nil);
}

-(void) testCanGetNumberOfDaysToAnotherDate {
	STAssertEqualObjects([NSNumber numberWithInt:[now daysToDate:tomorrow]], [NSNumber numberWithInt:1], nil);
}

-(void) testCanCheckIfDateIsAfterAnother {
	STAssertTrue([tomorrow isAfterDate:now], nil);
	STAssertFalse([now isAfterDate:tomorrow], nil);
	STAssertFalse([now isAfterDate:now], nil);
}

-(void) testCanCheckIfDateTimeIsAfterAnother {
	STAssertTrue([nowPlus30Seconds isAfterDateTime:now], nil);
	STAssertFalse([now isAfterDateTime:nowPlus30Seconds], nil);
}

-(void) testCanCheckIfDateIsBeforeAnother {
	STAssertTrue([now isBeforeDate:tomorrow], nil);
	STAssertFalse([tomorrow isBeforeDate:now], nil);
	STAssertFalse([now isBeforeDate:now], nil);
}

-(void) testCanCheckIfDateTimeIsBeforeAnother {
	STAssertTrue([now isBeforeDateTime:nowPlus30Seconds], nil);
	STAssertFalse([nowPlus30Seconds isBeforeDateTime:now], nil);
}

-(void) testCanCheckIfDateAreSameDay {
	STAssertTrue([now isSameDayThanDate:now], nil);
	STAssertFalse([tomorrow isSameDayThanDate:now], nil);
}

-(void) testCanCheckIfDateTimeAreSameDateTime {
	STAssertTrue([nowPlus30Seconds isSameDateTimeThanDateTime:nowPlus30Seconds], nil);
	STAssertFalse([now isSameDateTimeThanDateTime:nowPlus30Seconds], nil);
}

-(void) testCanCreateADate {
	[self assertDate:[NSDate dateWithYear:2011 month:2 andDay:5] isEqualToDate:fev052011];
}

-(void) testCanGetDateData {
	STAssertEqualObjects([NSNumber numberWithInt:[fev052011	day]], [NSNumber numberWithInt:5], nil);
	STAssertEqualObjects([NSNumber numberWithInt:[fev052011	month]], [NSNumber numberWithInt:2], nil);
	STAssertEqualObjects([NSNumber numberWithInt:[fev052011	year]], [NSNumber numberWithInt:2011], nil);
}

@end
