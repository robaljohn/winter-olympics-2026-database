INSERT INTO organizations (
    OrganizationID, Name, Type, Country, ContactEmail
) VALUES
    (1, 'International Olympic Committee', 'Olympic Committee', 'Switzerland', 'info@olympics.org'),
    (2, 'Italian Olympic Committee', 'National Olympic Committee', 'Italy', 'contact@coni.it'),
    (3, 'USA Track & Field', 'Sports Federation', 'USA', 'info@usatf.org'),
    (4, 'German Ski Association', 'Sports Federation', 'Germany', 'info@ski.de'),
    (5, 'Japan Skating Federation', 'Sports Federation', 'Japan', 'info@skating.jp');
    INSERT INTO national_olympic_committees (
    NOC_ID, Country, Code, OrganizationID
) VALUES
    (1, 'Italy', 'ITA', 2),
    (2, 'United States', 'USA', 3),
    (3, 'Germany', 'GER', 4),
    (4, 'Japan', 'JPN', 5),
    (5, 'Switzerland', 'SUI', 1);

INSERT INTO venue (
VenueID, `Name`, City, Capacity, `Type`
) VALUES
    (1, 'San Siro Stadium', 'Milan', 80000, 'Stadium'),
    (2, 'Cortina Ice Rink', 'Cortina', 12000, 'Ice Rink'),
    (3, 'Livigno Snow Park', 'Livigno', 5000, 'Snow Park'),
    (4, 'Bormio Alpine Centre', 'Bormio', 15000, 'Ski Slope'),
    (5, 'Fiera Milano', 'Milan', 10000, 'Indoor Arena');
INSERT INTO users (
    UserID, Username, Role, Email
) VALUES
    (1, 'mario_rossi', 'Spectator', 'mario.rossi@example.com'),
    (2, 'lisa_muller', 'Coach', 'lisa.muller@example.com'),
    (3, 'john_doe', 'Admin', 'john.doe@example.com'),
    (4, 'anna_bianchi', 'Sales', 'anna.bianchi@example.com'),
    (5, 'kenji_tanaka', 'Volunteer', 'kenji.tanaka@example.com');
-- Accommodation
INSERT INTO accommodation (AccommodationID, Name, Type, Capacity, Location) VALUES
(1, 'Olympic Village Milan', 'Apartment', 5000, 'Milan'),
(2, 'Cortina Lodge', 'Hotel', 400, 'Cortina'),
(3, 'Bormio Chalet', 'Lodge', 300, 'Bormio'),
(4, 'Livigno Residence', 'Apartment', 450, 'Livigno'),
(5, 'City Hotel Milano', 'Hotel', 200, 'Milan');
--  Lodging Partners
INSERT INTO lodging_partners (PartnerID, HotelName, Capacity, StarRating, DistanceToVenue) VALUES
(1, 'Hotel Principe di Savoia', 500, 5, 3.0),
(2, 'Cristallo Resort & Spa', 350, 5, 2.0),
(3, 'QC Terme Hotel', 400, 4, 4.5),
(4, 'Grand Hotel Bagni Nuovi', 300, 5, 5.0),
(5, 'NH Collection Milano', 250, 4, 1.5);
--  Sports
INSERT INTO sports (SportID, Name, Popularity_Level) VALUES
(1, 'Skiing', 'High'),
(2, 'Ice Hockey', 'High'),
(3, 'Figure Skating', 'Medium'),
(4, 'Snowboarding', 'Medium'),
(5, 'Speed Skating', 'Medium');
--  Sport Discipline
INSERT INTO sport_discipline (DisciplineID, SportID, Name) VALUES
(1, 1, 'Alpine Skiing'),
(2, 2, 'Men\'s Ice Hockey'),
(3, 3, 'Pairs Figure Skating'),
(4, 4, 'Snowboard Halfpipe'),
(5, 5, '500m Speed Skating');
--  Event
INSERT INTO event (EventID, Name, Gender, VenueID) VALUES
(1, 'Downhill', 'M', 4),
(2, 'Slalom', 'F', 4),
(3, 'Ice Hockey Final', 'M', 2),
(4, 'Figure Skating Final', 'F', 2),
(5, 'Halfpipe Final', 'M', 3);

INSERT INTO participation (ParticipationID, Date, EventID,VenueID) VALUES
(1, '2026-02-05', 1,2),
(2, '2026-02-06', 2,2),
(3, '2026-02-10', 3,1),
(4, '2026-02-12', 4,1),
(5, '2026-02-15', 5,2);
ALTER TABLE participation
ADD CONSTRAINT fk_participation_venue
FOREIGN KEY (VenueID) REFERENCES venue(VenueID);

INSERT INTO athlete (AthleteID, FullName, Gender, DOB, NOC_ID) VALUES
(1, 'Mikaela Shiffrin', 'F', '1995-03-13', 2),
(2, 'Yuzuru Hanyu', 'M', '1994-12-07', 4),
(3, 'Federica Brignone', 'F', '1990-07-14', 1),
(4, 'Felix Neureuther', 'M', '1984-03-26', 3),
(5, 'Beat Feuz', 'M', '1987-02-11', 5);

INSERT INTO result (ResultID, EventID, AthleteID, `Rank`, TimeOrScore, Medal) VALUES
(1, 1, 1, 1, '1:39.56', 'Gold'),
(2, 2, 3, 2, '52.23', 'Silver'),
(3, 4, 2, 1, '149.20', 'Gold'),
(4, 1, 4, 3, '1:41.22', 'Bronze'),
(5, 5, 5, 2, '92.5', 'Silver');
-- Event_Schedule
INSERT INTO event_schedule (ScheduleID, EventID, StartTime, EndTime) VALUES
(1, 1, '2026-02-05 10:00:00', '2026-02-05 12:00:00'),
(2, 2, '2026-02-06 14:00:00', '2026-02-06 16:00:00'),
(3, 3, '2026-02-10 18:00:00', '2026-02-10 20:00:00'),
(4, 4, '2026-02-12 19:00:00', '2026-02-12 21:00:00'),
(5, 5, '2026-02-15 15:00:00', '2026-02-15 17:00:00');

-- 15. Hospitality_Services
INSERT INTO hospitality_services (HospitalityID, Description, VenueID, Capacity) VALUES
(1, 'VIP Lounge', 1, 300),
(2, 'Athlete Rest Area', 2, 200),
(3, 'Sponsor Lounge', 3, 150),
(4, 'Press Room', 5, 100),
(5, 'Medical Station', 4, 120);

-- 16. Medical_Services
INSERT INTO medical_services (MedicalID, Description, StaffID, VenueID) VALUES
(1, 'Emergency Medical Team', 1, 1),
(2, 'First Aid Station', 2, 2),
(3, 'Athlete Physiotherapy', 3, 4),
(4, 'Paramedic Unit', 4, 5),
(5, 'General Clinic', 5, 3);



--  Security_Operations
INSERT INTO security_operations (SecurityID, Description, VenueID) VALUES
(1, 'VIP Security', 1),
(2, 'Crowd Control', 2),
(3, 'Athlete Escort', 3),
(4, 'Emergency Evacuation Team', 4),
(5, 'Venue Patrol', 5);
-- Media Personal
------------------------
INSERT INTO media_personal (MediaID, FullName, MediaOrg) VALUES
(1, 'Francesca Neri', 'RAI'),
(2, 'David Thompson', 'NBC Sports'),
(3, 'Yuki Sato', 'NHK'),
(4, 'Laura Gonzalez', 'Telemundo Deportes'),
(5, 'Hans Meier', 'ARD');

INSERT INTO accreditation (AccreditationID, Role, AccessLevel, IssueDate, ExpiryDate, MediaID) VALUES
(1, 'Journalist', 'Media', '2026-01-01', '2026-03-31', 1),
(2, 'Photographer', 'Media', '2026-01-01', '2026-03-31', 2),
(3, 'Camera Operator', 'Media', '2026-01-01', '2026-03-31', 3),
(4, 'Reporter', 'Media', '2026-01-01', '2026-03-31', 4),
(5, 'Analyst', 'Media', '2026-01-01', '2026-03-31', 5);



INSERT INTO officials_staff (Official_StaffID, FullName, Role, OrganizationID, Gender, Nationality, AccreditationID, MedicalID, SecurityID) VALUES
(1, 'Giovanni Russo', 'Judge', 2, 'M', 'Italy', 1, 1, 1),
(2, 'Susan White', 'Referee', 3, 'F', 'USA', 2, 2, 2),
(3, 'Akira Yamamoto', 'Judge', 5, 'M', 'Japan', 3, 3, 3),
(4, 'Hans Keller', 'Timekeeper', 4, 'M', 'Germany', 4, 4, 4),
(5, 'Maria Gonzalez', 'Referee', 1, 'F', 'Spain', 5, 5, 5);
-- Sponsors
INSERT INTO sponsors (SponsorID, Name, Tier, ContactPerson, OrganizationID) VALUES
(1, 'Coca-Cola', 'Gold', 'James Parker', 1),
(2, 'Samsung', 'Silver', 'Anna Kim', 2),
(3, 'Visa', 'Platinum', 'Richard Smith', 3),
(4, 'Toyota', 'Gold', 'Hiroshi Tanaka', 4),
(5, 'Omega', 'Official Timekeeper', 'Max Müller',5)
--  Transportation
INSERT INTO transportation (TransportID, Type, Capacity, OperatorName) VALUES
(1, 'Bus', 50, 'ATM Milan'),
(2, 'Shuttle', 20, 'Dolomiti Express'),
(3, 'Minivan', 8, 'Bormio Transfers'),
(4, 'Train', 200, 'Trenord'),
(5, 'Helicopter', 5, 'HeliService Milan');

-- 21. Transportation_Routes
INSERT INTO transportation_routes (RouteID, TransportID, StartLocation, EndLocation, Schedule) VALUES
(1, 1, 'Olympic Village', 'San Siro Stadium', '2026-02-05 08:00:00'),
(2, 2, 'Cortina Village', 'Ice Rink', '2026-02-06 10:00:00'),
(3, 3, 'Bormio Hotels', 'Alpine Centre', '2026-02-07 09:00:00'),
(4, 4, 'Milano Centrale', 'Venues', '2026-02-08 07:30:00'),
(5, 5, 'Milan Airport', 'Livigno Park', '2026-02-09 11:00:00');

--  Venue_Management
INSERT INTO venue_management (VenueID, OrganizationID) VALUES
(1, 2),
(2, 1),
(3, 4),
(4, 3),
(5, 5);


INSERT INTO volunteers (VolunteerID, FullName, Nationality, VenueID, ContactInfo) VALUES
(1, 'Elena Ferrari', 'Italy', 1, 'elena.ferrari@example.com'),
(2, 'Lukas Schmidt', 'Germany', 2, 'lukas.schmidt@example.com'),
(3, 'Sakura Tanaka', 'Japan', 3, 'sakura.tanaka@example.com'),
(4, 'Emily Johnson', 'USA', 4, 'emily.johnson@example.com'),
(5, 'Carlos Martinez', 'Spain', 5, 'carlos.martinez@example.com');

INSERT INTO volunteer_assignments (AssignmentID, VolunteerID, Role, StartDate, EndDate) VALUES
(1, 1, 'Usher', '2026-01-20', '2026-02-25'),
(2, 2, 'Information Desk', '2026-01-22', '2026-02-26'),
(3, 3, 'Medical Support', '2026-01-25', '2026-02-28'),
(4, 4, 'Security Assistance', '2026-01-27', '2026-03-01'),
(5, 5, 'VIP Assistance', '2026-01-30', '2026-03-05');
-- Equipment
------------------------
INSERT INTO equipment (EquipmentID, `Condition`, Name, Model) VALUES
(1, 'Excellent', 'Ski Boots', 'Atomic Redster'),
(2, 'Good', 'Snowboard', 'Burton Custom'),
(3, 'Excellent', 'Ice Skates', 'Riedell 435 Bronze Star'),
(4, 'Fair', 'Speed Skates', 'Viking Icon'),
(5, 'Good', 'Hockey Stick', 'Bauer Vapor FlyLite');

INSERT INTO `usage` (Date, EquipmentID, SportID, AthleteID) VALUES
('2026-02-05', 1, 1, 1),
('2026-02-06', 2, 4, 5),
('2026-02-10', 3, 3, 2),
('2026-02-12', 4, 5, 5),
('2026-02-15', 5, 2, 4);
-- Ticket
------------------------
INSERT INTO ticket (TicketID, EventID, Price, SeatNumber, Status) VALUES
(1, 1, 150.00, 'A01', 'Available'),
(2, 2, 120.00, 'B02', 'Available'),
(3, 3, 200.00, 'C03', 'Available'),
(4, 4, 180.00, 'D04', 'Available'),
(5, 5, 130.00, 'E05', 'Available');
-- 26. Weather_Conditions
INSERT INTO weather_conditions (WeatherID, VenueID, Date, Temperature, `Condition`) VALUES
(1, 1, '2026-02-05', 5, 'Clear'),
(2, 2, '2026-02-06', -2, 'Snow'),
(3, 3, '2026-02-07', -6, 'Blizzard'),
(4, 4, '2026-02-08', -4, 'Cloudy'),
(5, 5, '2026-02-09', 3, 'Sunny');
-- Users
------------------------
INSERT INTO users (UserID, Username, Role, Email) VALUES
(1, 'mario_rossi', 'Spectator', 'mario.rossi@example.com'),
(2, 'lisa_muller', 'Coach', 'lisa.muller@example.com'),
(3, 'john_doe', 'Admin', 'john.doe@example.com'),
(4, 'anna_bianchi', 'Sales', 'anna.bianchi@example.com'),
(5, 'kenji_tanaka', 'Volunteer', 'kenji.tanaka@example.com');


-- 27. Sales
INSERT INTO sales (SaleID, TicketID, UserID, SaleDate, Quantity) VALUES
(1, 1, 1, '2026-01-15', 2),
(2, 2, 2, '2026-01-16', 3),
(3, 3, 3, '2026-01-17', 1),
(4, 4, 4, '2026-01-18', 4),
(5, 5, 5, '2026-01-19', 2);
INSERT INTO Team_Delegations (DelegationID, NOC_ID, HeadOfDelegation, NumberOfStaff, ArrivalDate, DepartureDate) VALUES
(1, 1, 'Giuseppe Rossi', 20, '2026-02-01', '2026-02-25'),
(2, 2, 'John Doe', 25, '2026-02-02', '2026-02-26'),
(3, 3, 'Max Müller', 30, '2026-02-03', '2026-02-27'),
(4, 4, 'Taro Yamada', 22, '2026-02-04', '2026-02-28'),
(5, 5, 'Peter Meier', 18, '2026-02-05', '2026-03-01');
INSERT INTO Medal_Tally (TallyID, NOC_ID, Gold, Silver, Bronze) VALUES
(1, 1, 10, 5, 3),  -- Example: Italy (NOC_ID = 1)
(2, 2, 8, 6, 4),   -- Example: United States (NOC_ID = 2)
(3, 3, 12, 8, 7),  -- Example: Germany (NOC_ID = 3)
(4, 4, 9, 7, 5),   -- Example: Japan (NOC_ID = 4)
(5, 5, 15, 10, 6); -- Example: Switzerland (NOC_ID = 5)














