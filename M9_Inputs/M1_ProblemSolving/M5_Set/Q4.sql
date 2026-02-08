/*

Movie Rating. 

Problem Statement

Return two results:
User name who has rated the most movies
If there is a tie → pick the user with the lexicographically smaller name
Movie title with the highest average rating in February 2020
If there is a tie → pick the movie with the lexicographically smaller title


Input: 

Movies table:
+-------------+--------------+
| movie_id    | title    |
+-------------+--------------+
| 1           | Avengers |
| 2           | Frozen 2 |
| 3           | Joker    |
+-------------+--------------+

Users table:
+-------------+--------------+
| user_id      | name   |
+-------------+--------------+
| 1            | Daniel |
| 2            | Monica |
| 3            | Maria  |
| 4            | James  |
+-------------+--------------+


MovieRating table:
+-------------+--------------+--------------+-------------+
| movie_id  | user_id   | rating    | created_at |
+-------------+--------------+--------------+-------------+
| 1         | 1         | 3         | 2020-01-12 |
| 1         | 2         | 4         | 2020-02-11 |
| 1         | 3         | 2         | 2020-02-12 |
| 1         | 4         | 1         | 2020-01-01 |
| 2         | 1         | 5         | 2020-02-17 | 
| 2         | 2         | 2         | 2020-02-01 | 
| 2         | 3         | 2         | 2020-03-01 |
| 3         | 1         | 3         | 2020-02-22 | 
| 3         | 2         | 4         | 2020-02-25 | 
+-------------+--------------+--------------+-------------+

Output: 
+--------------+
| results   |
+--------------+
| Daniel    |
| Frozen 2  |
+--------------+


*/


/*


-- Create Movies table
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100)
);

-- Insert data into Movies
INSERT INTO Movies (movie_id, title) VALUES
(1, 'Avengers'),
(2, 'Frozen 2'),
(3, 'Joker');


-- Create Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Insert data into Users
INSERT INTO Users (user_id, name) VALUES
(1, 'Daniel'),
(2, 'Monica'),
(3, 'Maria'),
(4, 'James');


-- Create MovieRating table
CREATE TABLE MovieRating (
    movie_id INT,
    user_id INT,
    rating INT,
    created_at DATE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Insert data into MovieRating
INSERT INTO MovieRating (movie_id, user_id, rating, created_at) VALUES
(1, 1, 3, '2020-01-12'),
(1, 2, 4, '2020-02-11'),
(1, 3, 2, '2020-02-12'),
(1, 4, 1, '2020-01-01'),
(2, 1, 5, '2020-02-17'),
(2, 2, 2, '2020-02-01'),
(2, 3, 2, '2020-03-01'),
(3, 1, 3, '2020-02-22'),
(3, 2, 4, '2020-02-25');


*/


(
    SELECT name AS results
    FROM Users u
    JOIN MovieRating mr ON u.user_id = mr.user_id
    GROUP BY u.user_id, u.name
    ORDER BY COUNT(mr.movie_id) DESC, u.name
    FETCH FIRST 1 ROWS ONLY
)
UNION ALL
(
    SELECT title AS results
    FROM Movies m
    JOIN MovieRating mr ON m.movie_id = mr.movie_id
    GROUP BY m.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title
    FETCH FIRST 1 ROWS ONLY
);
