-- Organizations 
CREATE TABLE Organizations (

    OrganizationID INT PRIMARY KEY,

    Name VARCHAR(100),

    Type VARCHAR(50),

    Country VARCHAR(50),

    ContactEmail VARCHAR(100)

);



-- Sports

CREATE TABLE Sports (

    SportID INT PRIMARY KEY,

    Name VARCHAR(100),

    Popularity_Level VARCHAR(50)

);



-- Sport Discipline

CREATE TABLE Sport_Discipline (

    DisciplineID INT PRIMARY KEY,

    SportID INT,

    Name VARCHAR(100),

    FOREIGN KEY (SportID) REFERENCES Sports(SportID)

);



-- Venue

CREATE TABLE Venue (

    VenueID INT PRIMARY KEY,

    Name VARCHAR(100),

    City VARCHAR(100),

    Capacity INT,

    Type VARCHAR(50)

);



-- Venue Management

CREATE TABLE Venue_Management (

    VenueID INT,

    OrganizationID INT,

    PRIMARY KEY (VenueID, OrganizationID),

    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID),

    FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID)

);



-- National Olympic Committees

CREATE TABLE National_Olympic_Committees (

    NOC_ID INT PRIMARY KEY,

    Country VARCHAR(100),

    Code VARCHAR(10),

    OrganizationID INT,

    FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID)

);



-- Team Delegations

CREATE TABLE Team_Delegations (

    DelegationID INT PRIMARY KEY,

    NOC_ID INT,

    HeadOfDelegation VARCHAR(100),

    NumberOfStaff INT,

    ArrivalDate DATE,

    DepartureDate DATE,

    FOREIGN KEY (NOC_ID) REFERENCES National_Olympic_Committees(NOC_ID)

);



-- Accommodation

CREATE TABLE Accommodation (

    AccommodationID INT PRIMARY KEY,

    Name VARCHAR(100),

    Type VARCHAR(50),

    Capacity INT,

    Location VARCHAR(255)

);



-- Media Personal

CREATE TABLE Media_Personal (

    MediaID INT PRIMARY KEY,

    FullName VARCHAR(100),

    MediaOrg VARCHAR(100)

);



-- Accreditation

CREATE TABLE Accreditation (

    AccreditationID INT PRIMARY KEY,

    Role VARCHAR(50),

    AccessLevel VARCHAR(50),

    IssueDate DATE,

    ExpiryDate DATE,

    MediaID INT,

    FOREIGN KEY (MediaID) REFERENCES Media_Personal(MediaID)

);



-- Transportation

CREATE TABLE Transportation (

    TransportID INT PRIMARY KEY,

    Type VARCHAR(50),

    Capacity INT,

    OperatorName VARCHAR(100)

);



-- Transportation Routes

CREATE TABLE Transportation_Routes (

    RouteID INT PRIMARY KEY,

    TransportID INT,

    StartLocation VARCHAR(100),

    EndLocation VARCHAR(100),

    Schedule VARCHAR(100),

    FOREIGN KEY (TransportID) REFERENCES Transportation(TransportID)

);



-- Hospitality Services

CREATE TABLE Hospitality_Services (

    HospitalityID INT PRIMARY KEY,

    Description TEXT,

    VenueID INT,

    Capacity INT,

    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)

);



-- Lodging Partners

CREATE TABLE Lodging_Partners (

    PartnerID INT PRIMARY KEY,

    HotelName VARCHAR(100),

    Capacity INT,

    StarRating INT,

    DistanceToVenue DECIMAL(5,2)

);



-- Security Operations

CREATE TABLE Security_Operations (

    SecurityID INT PRIMARY KEY,

    Description TEXT,

    VenueID INT,

    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)

);



-- Medical Services

CREATE TABLE Medical_Services (

    MedicalID INT PRIMARY KEY,

    Description TEXT,

    StaffID INT,

    VenueID INT,

    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)

);



-- Officials Staff

CREATE TABLE Officials_Staff (

    Official_StaffID INT PRIMARY KEY,

    FullName VARCHAR(100),

    Role VARCHAR(50),

    OrganizationID INT,

    Gender CHAR(1),

    Nationality VARCHAR(50),

    AccreditationID INT,

    MedicalID INT,

    SecurityID INT,

    FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID),

    FOREIGN KEY (AccreditationID) REFERENCES Accreditation(AccreditationID),

    FOREIGN KEY (MedicalID) REFERENCES Medical_Services(MedicalID),

    FOREIGN KEY (SecurityID) REFERENCES Security_Operations(SecurityID)

);



-- Sponsors

CREATE TABLE Sponsors (

    SponsorID INT PRIMARY KEY,

    Name VARCHAR(100),

    Tier VARCHAR(20),

    ContactPerson VARCHAR(100),

    OrganizationID INT,

    FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID)

);



-- Equipment

CREATE TABLE Equipment (

    EquipmentID INT PRIMARY KEY,

    `Condition` VARCHAR(50),

    Name VARCHAR(100),

    Model VARCHAR(50)

);



-- Athlete

CREATE TABLE Athlete (

    AthleteID INT PRIMARY KEY,

    FullName VARCHAR(100),

    Gender CHAR(1),

    DOB DATE,

    NOC_ID INT,

    FOREIGN KEY (NOC_ID) REFERENCES National_Olympic_Committees(NOC_ID)

);



-- Event must come BEFORE Ticket

CREATE TABLE Event (

    EventID INT PRIMARY KEY,

    Name VARCHAR(100),

    Gender CHAR(1),

    VenueID INT,

    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)

);



-- Ticket (after Event exists)

CREATE TABLE Ticket (

    TicketID INT PRIMARY KEY,

    EventID INT,

    Price DECIMAL(8,2),

    SeatNumber VARCHAR(10),

    Status VARCHAR(20),

    FOREIGN KEY (EventID) REFERENCES Event(EventID)

);



-- Users

CREATE TABLE Users (

    UserID INT PRIMARY KEY,

    Username VARCHAR(100),

    Role VARCHAR(50),

    Email VARCHAR(100)

);



-- Sales (after Ticket exists)

CREATE TABLE Sales (

    SaleID INT PRIMARY KEY,

    TicketID INT,

    UserID INT,

    SaleDate DATE,

    Quantity INT,

    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID),

    FOREIGN KEY (UserID) REFERENCES Users(UserID)

);



-- Event Schedule

CREATE TABLE Event_Schedule (

    ScheduleID INT PRIMARY KEY,

    EventID INT,

    StartTime TIMESTAMP,

    EndTime TIMESTAMP,

    FOREIGN KEY (EventID) REFERENCES Event(EventID)

);



-- Weather Conditions

CREATE TABLE Weather_Conditions (

    WeatherID INT PRIMARY KEY,

    VenueID INT,

    Date DATE,

    Temperature DECIMAL(5,2),

    `Condition` VARCHAR(50),

    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)

);



-- Volunteers

CREATE TABLE Volunteers (

    VolunteerID INT PRIMARY KEY,

    FullName VARCHAR(100),

    Nationality VARCHAR(50),

    VenueID INT,

    ContactInfo VARCHAR(100),

    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)

);



-- Volunteer Assignments

CREATE TABLE Volunteer_Assignments (

    AssignmentID INT PRIMARY KEY,

    VolunteerID INT,

    Role VARCHAR(50),

    StartDate DATE,

    EndDate DATE,

    FOREIGN KEY (VolunteerID) REFERENCES Volunteers(VolunteerID)

);



-- Medal Tally

CREATE TABLE Medal_Tally (

    TallyID INT PRIMARY KEY,

    NOC_ID INT,

    Gold INT,

    Silver INT,

    Bronze INT,

    FOREIGN KEY (NOC_ID) REFERENCES National_Olympic_Committees(NOC_ID)

);



-- Participation

CREATE TABLE Participation (

    ParticipationID INT PRIMARY KEY

);



-- Athlete Event Participation

CREATE TABLE Athlete_Event_Participation (

    ParticipationID INT PRIMARY KEY,

    AthleteID INT,

    EventID INT,

    FOREIGN KEY (AthleteID) REFERENCES Athlete(AthleteID),

    FOREIGN KEY (ParticipationID) REFERENCES Participation(ParticipationID)

);



-- Result

CREATE TABLE Result (

    ResultID INT PRIMARY KEY,

    EventID INT,

    AthleteID INT,

    `Rank` INT,

    TimeOrScore VARCHAR(50),

    Medal VARCHAR(20),

    FOREIGN KEY (EventID) REFERENCES Event(EventID),

    FOREIGN KEY (AthleteID) REFERENCES Athlete(AthleteID)

);



-- Usage (Equipment <-> Sport <-> Athlete)

CREATE TABLE `Usage` (

    Date DATE,

    EquipmentID INT,

    SportID INT,

    AthleteID INT,

    PRIMARY KEY (Date, EquipmentID, SportID, AthleteID),

    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID),

    FOREIGN KEY (SportID) REFERENCES Sports(SportID),

    FOREIGN KEY (AthleteID) REFERENCES Athlete(AthleteID)

);