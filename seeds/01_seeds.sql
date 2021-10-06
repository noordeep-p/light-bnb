INSERT INTO users (name, email, password)
VALUES ('John', 'John@gm.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Harry', 'Harry@gm.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Ron', 'Ron@gm.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (title, description, owner_id, cover_photo_url, thumbnail_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, active, province, city, country, street, post_code) 
VALUES ('Suburban Getaway', 'description', 1, 'https://tinyurl.com/kpkw2uk', 'https://tinyurl.com/kpkw2uk', 400, 1, 1, 1, TRUE, 'Ontario', 'Toronto', 'Canada', 'Oh Canada', 123456),
('Urban Getaway', 'description', 2, 'https://tinyurl.com/anvmcs36', 'https://tinyurl.com/anvmcs36', 700, 4, 4, 4, TRUE, 'Ontario', 'Toronto', 'Canada', 'Oh Canada', 123378),
('Cottage Getaway', 'description', 3, 'https://tinyurl.com/yjc4u8ue', 'https://tinyurl.com/yjc4u8ue', 900, 7, 7, 5, TRUE, 'Ontario', 'Muskoka', 'Canada', 'Oh Canada', 122336);

INSERT INTO reservations (guest_id, property_id, start_date, end_date)
VALUES (1, 1, '2018-09-11', '2018-09-26'),
(2, 2, '2019-01-04', '2019-02-01'),
(3, 3, '2021-10-01', '2021-10-14');

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (1, 1, 1, 4, 'message'),
(2, 2, 2, 5, 'message'),
(3, 3, 3, 5, 'message');