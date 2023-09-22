create schema users;

create table users.users (
    user_id bigint generated always as identity,
    name varchar(255) not null,
    email varchar(255) not null,
    password varchar(255) not null,
    role varchar(255) not null,
    is_contributor boolean not null,
    is_archived boolean not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    primary key (user_id)
);

create index users_users_name_idx on users.users (name);
create unique index users_users_email_idx on users.users (email);

create schema vehicles;

create table vehicles.models (
    model_id bigint generated always as identity,
    make varchar(255) not null,
    model varchar(255) not null,
    year smallint not null,
    is_archived boolean not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    primary key (model_id)
);

create table vehicles.vehicles (
    vehicle_id bigint generated always as identity,
    model_id bigint not null,
    user_id bigint not null,
    license_plate varchar(10) not null,
    color varchar(255) not null,
    is_archived boolean not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    primary key (vehicle_id),
    foreign key (user_id) references users.users (user_id),
    foreign key (model_id) references vehicles.models (model_id)
);

create table vehicles.vehicle_users (
    vehicle_id bigint not null,
    user_id bigint not null,
    is_archived boolean not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    primary key (vehicle_id, user_id),
    foreign key (vehicle_id) references vehicles.vehicles (vehicle_id),
    foreign key (user_id) references users.users (user_id)
);

create table vehicles.sensors (
    sensor_id bigint generated always as identity,
    vehicle_id bigint not null,
    type varchar(255) not null,
    location varchar(255) not null,
    data_type varchar(255) not null,
    data_format varchar(255) not null,
    is_archived boolean not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    primary key (sensor_id),
    foreign key (vehicle_id) references vehicles.vehicles (vehicle_id)
);

create unique index vehicles_vehicles_license_plate_idx on vehicles.vehicles (license_plate);
create index vehicles_vehicle_users_vehicle_id_idx on vehicles.vehicle_users (vehicle_id);
create index vehicles_vehicle_users_user_id_idx on vehicles.vehicle_users (user_id);
create index vehicles_sensors_vehicle_id_idx on vehicles.sensors (vehicle_id);

create schema reports;

-- Messages from sensors that logs location, speed, acceleration, etc.
create table reports.vehicle_track_reports (
    vehicle_track_report_id bigint generated always as identity,
    vehicle_id bigint not null,
    location point not null,
    altitude double precision not null,
    direction double precision not null,
    speed double precision not null,
    acceleration double precision not null,
    fuel double precision not null,
    temperature double precision not null,
    humidity double precision not null,
    pressure double precision not null,
    additional_data jsonb null,
    created_at timestamp not null,
    --primary key (vehicle_track_report_id),
    foreign key (vehicle_id) references vehicles.vehicles (vehicle_id)
);

create table reports.vehicle_spotting_reports (
    vehicle_spotting_report_id bigint generated always as identity,
    vehicle_id bigint not null,
    type varchar(255) not null,
    location point not null,
    altitude double precision not null,
    direction double precision not null,
    speed double precision not null,
    acceleration double precision not null,
    fuel double precision not null,
    temperature double precision not null,
    humidity double precision not null,
    pressure double precision not null,
    additional_data jsonb null,
    created_at timestamp not null,
    --primary key (vehicle_spotting_report_id),
    foreign key (vehicle_id) references vehicles.vehicles (vehicle_id)
);

create table reports.vehicle_alert_reports (
    vehicle_alert_report_id bigint generated always as identity,
    vehicle_id bigint not null,
    type varchar(255) not null,
    location point not null,
    altitude double precision not null,
    direction double precision not null,
    speed double precision not null,
    acceleration double precision not null,
    fuel double precision not null,
    temperature double precision not null,
    humidity double precision not null,
    pressure double precision not null,
    additional_data jsonb null,
    created_at timestamp not null,
    --primary key (vehicle_alert_report_id),
    foreign key (vehicle_id) references vehicles.vehicles (vehicle_id)
);



create index reports_vehicle_track_reports_type_vehicle_id_idx on reports.vehicle_track_reports (vehicle_id);
create index reports_vehicle_track_reports_location_idx on reports.vehicle_track_reports using spgist (location);
create index reports_vehicle_track_reports_created_at_idx on reports.vehicle_track_reports (created_at);
create index reports_vehicle_spotting_reports_type_vehicle_id_idx on reports.vehicle_spotting_reports (type, vehicle_id);
create index reports_vehicle_spotting_reports_location_idx on reports.vehicle_spotting_reports using spgist (location);
create index reports_vehicle_spotting_reports_created_at_idx on reports.vehicle_spotting_reports (created_at);
create index reports_vehicle_alert_reports_type_vehicle_id_idx on reports.vehicle_alert_reports (type, vehicle_id);
create index reports_vehicle_alert_reports_location_idx on reports.vehicle_alert_reports using spgist (location);
create index reports_vehicle_alert_reports_created_at_idx on reports.vehicle_alert_reports (created_at);

create schema trips;

create table trips.trips (
    trip_id bigint generated always as identity,
    user_id bigint not null,
    vehicle_id bigint not null,
    start_location varchar(255), --point not null,
    end_location varchar(255), --point not null,
    start_time timestamp not null,
    end_time timestamp not null,
    distance double precision not null,
    duration interval not null,
    created_at timestamp not null,
    updated_at timestamp not null,
    primary key (trip_id),
    foreign key (user_id) references users.users (user_id),
    foreign key (vehicle_id) references vehicles.vehicles (vehicle_id)
);

create index trips_trips_vehicle_id_idx on trips.trips (vehicle_id);