INSERT INTO users (name, email, password)
VALUES ('John', 'John@gm.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
('Harry', 'Harry@gm.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u'),
('Ron', 'Ron@gm.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u');

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, 
country, street, city, province, post_code, active)
VALUES (1, 'Suburban Getaway', 'description', 'https://tinyurl.com/kpkw2uk', 'https://tinyurl.com/kpkw2uk', 400, 1, 1, 1, 'Canada', 'Oh Canada', 'Toronto', 'Ontario', 123456, TRUE),
(1, 'Urban Getaway', 'description', 'https://tinyurl.com/anvmcs36', 'https://tinyurl.com/anvmcs36', 700, 4, 4, 4, 'Canada', 'Oh Canada', 'Toronto', 'Ontario', 123378, TRUE),
(1, 'Cottage Getaway', 'description', 'https://tinyurl.com/yjc4u8ue', 'https://tinyurl.com/yjc4u8ue', 900, 7, 7, 5, 'Canada', 'Oh Canada', 'Muskoka', 'Ontario', 122336, TRUE);

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-09-11', '2018-09-26', 1, 1),
('2019-01-04', '2019-02-01', 2, 2),
('2021-10-01', '2021-10-14', 3, 3);

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (1, 1, 1, 4, 'message'),
(1, 2, 2, 5, 'message'),
(3, 2, 3, 5, 'message');